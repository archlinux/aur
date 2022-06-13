# Maintainer: Aanok <aanok.aur@gmail.com>
pkgname='jftui'
pkgver=0.5.2
pkgrel=2
pkgdesc="TUI client for Jellyfin based on mpv"
arch=('x86_64')
url="https://github.com/Aanok/jftui"
license=('Unlicense')
makedepends=('gcc' 'pkgconf' 'make')
depends=('mpv' 'yajl' 'curl')
provides=("${pkgname}")
conflicts=('jftui-git')
source=("https://github.com/Aanok/jftui/archive/v${pkgver}.tar.gz")
sha256sums=('b64c0ed51bf041e4b8c7e84c3bbd501b071f5717f04b5b846d39abda55c71dc9')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	sed -i 's/clang/gcc/' Makefile
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}
