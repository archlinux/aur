# Maintainer KDE
# Maintainer Stoyan Minaev <stoyan.minaev@gmail.com>

pkgbase=plasma-angelfish
pkgname=plasma-angelfish
pkgver=1.3.0
pkgrel=1
pkgdesc="Plasma Demo Webbrowser for Mobile Devices"
url="https://github.com/KDE/plasma-angelfish"
license=('GPL2')
source=(
    https://codeload.github.com/KDE/$pkgname/tar.gz/v$pkgver
)
md5sums=(
    '777e55a620b1c53cf584c636fd89e93b'
)
arch=('x86_64')

depends=(
   plasma-framework
)

makedepends=(
    extra-cmake-modules
)

prepare() {
    cd $srcdir/$pkgname-$pkgver
    mkdir -p build
}

build() {
    cd $srcdir/$pkgname-$pkgver
    cd build
    cmake -DCMAKE_INSTALL_PREFIX="/usr/local" -DBUILD_TESTING=OFF ..
}

package() {
    cd $srcdir/$pkgname-$pkgver
    cd build
    make DESTDIR="$pkgdir" install
}

#vim: syntax=sh
