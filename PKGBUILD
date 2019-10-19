# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=iqpuzzle
pkgver=1.1.4
pkgrel=1
pkgdesc='A diverting and challenging pentomino puzzle.'
arch=('i686' 'x86_64')
url='https://github.com/ElTh0r0/iqpuzzle/'
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme')
source=("https://github.com/ElTh0r0/iqpuzzle/archive/v$pkgver.tar.gz")
sha256sums=('4fa223974d7f81b9c8ba3fd0628b40c3883e5e4ad82b9f2227ef0b48bdabc117')

build() {
    cd "$pkgname-$pkgver"
    qmake-qt5 PREFIX=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make INSTALL_ROOT="$pkgdir/" install
}
