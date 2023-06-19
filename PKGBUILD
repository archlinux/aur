# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Jay Ta'ala <jay@jaytaala.com>
# Contributor: Maciej Mazur <mamciek@gmail.com>

pkgname=alttab
pkgver=1.7.1
pkgrel=1
pkgdesc="The task switcher for minimalistic window managers or standalone X11 session"
url="https://github.com/sagb/${pkgname}"
license=('GPL3')
arch=('x86_64' 'i686' 'aarch64')
depends=('libx11' 'libxmu' 'libxft' 'libxrender' 'libxrandr' 'libpng' 'uthash' 'libxpm')
makedepends=('autoconf' 'automake' 'git')
_commit="fad928ba0c7e48a151726e1279d28e64a53d9ecc" # 1.7.1
source=(
  # "git+${url}#commit=${_commit}"
  "${url}/archive/refs/tags/v${pkgver}.tar.gz"
 )
sha256sums=('0926b12cc0ad9f63a6242ede3b0f9cae6f30f61ccb050740df55bfb6f531f303')

build() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
