# Maintainer KDE
# Maintainer Stoyan Minaev <stoyan.minaev@gmail.com>

pkgbase=plasma-angelfish
pkgname=plasma-angelfish
pkgver=1.5.1
pkgrel=1
pkgdesc="Plasma Demo Webbrowser for Mobile Devices"
url="https://github.com/KDE/plasma-angelfish"
license=('GPL2')
source=(
    https://codeload.github.com/KDE/$pkgname/tar.gz/v$pkgver
)
md5sums=(
    'c59f96e6b118cfe2073c2fef3fda6951'
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
