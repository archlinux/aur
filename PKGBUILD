# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=iqpuzzle
pkgver=1.1.2
pkgrel=1
pkgdesc='A diverting and challenging pentomino puzzle.'
arch=('i686' 'x86_64')
url='https://github.com/ElTh0r0/iqpuzzle/'
license=('GPL3')
depends=('qt5-base')
source=("https://github.com/ElTh0r0/iqpuzzle/archive/v$pkgver.tar.gz")
sha256sums=('b7fb87c197dbd6ef8c7fbcf064e53416f9f38a034efb35e1d381ac233a55801c')

build() {
    cd "$pkgname-$pkgver"
    qmake-qt5 PREFIX=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make INSTALL_ROOT="$pkgdir/" install
}
