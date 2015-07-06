# Maintainer: gagiD <gagid@openmailbox.com>
pkgname=gchecksum
pkgver=0.1
pkgrel=1
pkgdesc="GUI frontend for system.util sums. C++ && Qt framework."
arch=('i686' 'x86_64')
url='https://github.com/gagiD/GCheckSum'
license=('GPL')
groups=('qt' 'qt5')
makedepends=('qt5-base' 'desktop-file-utils' 'gtk-update-icon-cache')
depends=('qt5-base')
install='gchecksum.install'
source=("https://github.com/gagiD/GCheckSum/blob/master/pkg/${pkgname}-${pkgver}.tar.gz?raw=true")
md5sums=('SKIP')

prepare() {
	cd "$srcdir"
	qmake-qt5 PREFIX=/usr
}

build() {
	cd "$srcdir"
	make
}

check() {
	cd "$srcdir"
	make -k check
}

package() {
	cd "$srcdir"
	make INSTALL_ROOT="${pkgdir}" install
}
