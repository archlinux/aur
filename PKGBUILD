# Maintainer: Daniel Maslowski <info@orangecms.org>

_gitname=upplay
pkgname=${_gitname}-git
pkgver=r492.d686fc5
pkgrel=1
pkgdesc="A Qt-based UPnP audio Control point"
url="http://www.lesbonscomptes.com/upplay/"
arch=('x86_64')
license=('GPL2')
depends=('libupnpp>=0.15.3'
         'qt5-webkit'
         'hicolor-icon-theme')
makedepends=('qt5-script')
source=("git+https://opensourceprojects.eu/git/p/upplay/code")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/code"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/code"
	qmake -o Makefile upplay.pro PREFIX=/usr
}

package() {
	cd "${srcdir}/code"
	make install INSTALL_ROOT="${pkgdir}"
}
