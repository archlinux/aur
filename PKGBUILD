# Maintainer: Thibaud Kehler <thibaud.kehler at gmx dot net>
pkgname='fet-timetabling'
_module='fet'
pkgver=6.16.1
pkgrel=1
pkgdesc="A software for automatically scheduling the timetable of a school, high-school or university."
arch=('x86_64' 'i686')
url="http://lalescu.ro/liviu/fet/"
license=('AGPL3')
depends=('qt5-base' 'hicolor-icon-theme')
source=("https://lalescu.ro/liviu/fet/download/fet-${pkgver}.tar.bz2")
sha256sums=('9434a2f474fd06c3b094fdf2c8ac92de64dc6ae2098d0b374bbef3027613a9d8')

build() {
	cd "$srcdir/$_module-$pkgver"
	qmake-qt5 fet.pro "DEFINES+=USE_SYSTEM_LOCALE"
	make
}

package() {
	cd "$srcdir/$_module-$pkgver"
	make INSTALL_ROOT="${pkgdir}/" install
}
