# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=stackandconquer
pkgver=0.9.0
pkgrel=1
pkgdesc='A challenging tower conquest board game.'
arch=('x86_64')
url='https://github.com/ElTh0r0/stackandconquer/'
license=('GPL3')
depends=('qt5-declarative' 'qt5-svg' 'hicolor-icon-theme')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ElTh0r0/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('7b229e8d6bb29ebc54a69a2eba7ecae07f667b6daec41a7a685e7678df83eb38')

build() {
    cd "$pkgname-$pkgver"
    lrelease-qt5 $pkgname.pro
    qmake-qt5 PREFIX=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make INSTALL_ROOT="$pkgdir/" install
}
