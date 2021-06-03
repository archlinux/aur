# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=iqpuzzle
pkgver=1.2.5
pkgrel=1
pkgdesc='A diverting and challenging pentomino puzzle.'
arch=('i686' 'x86_64')
url='https://github.com/ElTh0r0/iqpuzzle/'
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ElTh0r0/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('cba8ee03b11e65f7c859a1056a933b6e26a7f74dc0e6bcc7ec5f6c3fa9aafc80')

build() {
    cd "$pkgname-$pkgver"
    qmake-qt5 PREFIX=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make INSTALL_ROOT="$pkgdir/" install
}
