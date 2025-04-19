# Maintainer: Thibaud Kehler <thibaud.kehler at gmx dot net>
pkgname='fet-timetabling'
_module='fet'
pkgver=7.1.6
pkgrel=1
pkgdesc="A software for automatically scheduling the timetable of a school, high-school or university."
arch=('x86_64' 'i686')
url="http://lalescu.ro/liviu/fet/"
license=('AGPL3')
depends=('qt5-base' 'hicolor-icon-theme')
source=("https://lalescu.ro/liviu/fet/download/fet-${pkgver}.tar.bz2")
sha256sums=('d1f570a89adf429652ce5f2496bd3e7801d8ff7455200c334c165aa5eb363d6f')

build() {
	cd "$srcdir/$_module-$pkgver"
	qmake-qt5 fet.pro "DEFINES+=USE_SYSTEM_LOCALE"
	make
}

package() {
	cd "$srcdir/$_module-$pkgver"
	make INSTALL_ROOT="${pkgdir}/" install
}
