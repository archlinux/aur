# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=iqpuzzle
pkgver=1.1.5
pkgrel=1
pkgdesc='A diverting and challenging pentomino puzzle.'
arch=('i686' 'x86_64')
url='https://github.com/ElTh0r0/iqpuzzle/'
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme')
source=("https://github.com/ElTh0r0/iqpuzzle/archive/v$pkgver.tar.gz")
sha256sums=('f03a0c7d44e019dbb7b1db70e1691a7295971afce452f9f7ba7056f9aa8bde8e')

build() {
    cd "$pkgname-$pkgver"
    qmake-qt5 PREFIX=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make INSTALL_ROOT="$pkgdir/" install
}
