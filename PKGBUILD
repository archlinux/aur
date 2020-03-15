# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=iqpuzzle
pkgver=1.2.0
pkgrel=1
pkgdesc='A diverting and challenging pentomino puzzle.'
arch=('i686' 'x86_64')
url='https://github.com/ElTh0r0/iqpuzzle/'
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ElTh0r0/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('52687aa8c7bfd9d297c13f34ba07b6222252132a48c21ca97627f0aec656a2ab')

build() {
    cd "$pkgname-$pkgver"
    qmake-qt5 PREFIX=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make INSTALL_ROOT="$pkgdir/" install
}
