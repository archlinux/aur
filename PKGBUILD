# Maintainer: Oliver Sagner <oliver.sagner@jwo.com.de>
pkgname='tu2'
pkgver=1.2.3
pkgrel=1
pkgdesc="Specalized Project Management System with presentation"
arch=('i686' 'x86_64')
url="http://github.com/ntropy83/tu2"
license=('GPL')
depends=('qt5-base')
source=("https://github.com/ntropy83/$pkgname/archive/$pkgver.tar.gz")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	qmake "Projektverwaltung.pro"
        CONFIG+=release

	make
}

package(){
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 $srcdir/$pkgname-$pkgver/Projektverwaltung "${pkgdir}"/usr/bin/$pkgname
	install -Dm755 $srcdir/$pkgname-$pkgver/.qm/tu2_de.qm "${pkgdir}"/usr/lib/tu2/languages/tu2_de.qm
	install -Dm755 $srcdir/$pkgname-$pkgver/.qm/tu2_en.qm "${pkgdir}"/usr/lib/tu2/languages/tu2_en.qm
	install -Dm755 $srcdir/$pkgname-$pkgver/tu2.desktop "${pkgdir}"/usr/share/applications/tu2.desktop
}
