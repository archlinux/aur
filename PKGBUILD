# Maintainer: Karol Babioch <karol@babioch.de>
# Contributor: Tristelune <tristelune@archlinux.info>

pkgname=qtspell
pkgver=0.8.5
pkgrel=1
pkgdesc="Spell checking for Qt text widgets"
arch=('i686' 'x86_64')
url="https://github.com/manisandro/qtspell"
license=('GPL3')
depends=('enchant' 'iso-codes' 'qt5-tools')
makedepends=('cmake' 'doxygen')
source=("git+https://github.com/manisandro/$pkgname.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    mkdir -p build
    cd build
    cmake -DUSE_QT5=true -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "$srcdir/$pkgname/build"
    make DESTDIR="$pkgdir"/ install
}

