# Maintainer: Thibaud Kehler <thibaud.kehler at gmx dot net>
pkgname='fet-timetabling'
_module='fet'
pkgver=7.5.4
pkgrel=1
pkgdesc="A software for automatically scheduling the timetable of a school, high-school or university."
arch=('x86_64' 'i686')
url="http://lalescu.ro/liviu/fet/"
license=('AGPL3')
depends=('qt6-base' 'hicolor-icon-theme')
source=("https://lalescu.ro/liviu/fet/download/fet-${pkgver}.tar.bz2")
sha256sums=('61481b76fccabd6dc81dcb28d93d2f2d2585819915b21933b37d0fbd53de526e')

build() {
	cd "$srcdir/$_module-$pkgver"
	/usr/lib/qt6/bin/qmake fet.pro "DEFINES+=USE_SYSTEM_LOCALE"
	make
}

package() {
	cd "$srcdir/$_module-$pkgver"
	make INSTALL_ROOT="${pkgdir}/" install
}
