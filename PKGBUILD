# Maintainer: Thibaud Kehler <thibaud.kehler at gmx dot net>
pkgname='fet-timetabling'
_module='fet'
pkgver=6.13.2
pkgrel=1
pkgdesc="A software for automatically scheduling the timetable of a school, high-school or university."
arch=('x86_64' 'i686')
url="http://lalescu.ro/liviu/fet/"
license=('AGPL3')
depends=('qt5-base' 'hicolor-icon-theme')
source=("https://lalescu.ro/liviu/fet/download/fet-${pkgver}.tar.bz2")
sha256sums=('9a5de73bba78b9fcbfeb5d95d68233d83f8c8b940da637903e0116d3a36520bf')

build() {
	cd "$srcdir/$_module-$pkgver"
	qmake-qt5 fet.pro "DEFINES+=USE_SYSTEM_LOCALE"
	make
}

package() {
	cd "$srcdir/$_module-$pkgver"
	make INSTALL_ROOT="${pkgdir}/" install
}
