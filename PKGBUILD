# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=stackandconquer
pkgver=0.10.0
pkgrel=1
pkgdesc='A challenging tower conquest board game.'
arch=('x86_64')
url='https://github.com/ElTh0r0/stackandconquer/'
license=('GPL3')
makedepends=('qt5-tools')
depends=('qt5-declarative' 'qt5-svg' 'hicolor-icon-theme')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ElTh0r0/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b9b6c2b0ced8800396e8a27451244143abbcb02a91f747560dc2a66da73e8a51')

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
