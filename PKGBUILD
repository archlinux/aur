# Maintainer: Yukari Hafner <shinmera@tymoon.eu>
pkgname=libsf3
pkgver=1.1
pkgrel=1
epoch=0
pkgdesc="C library to parse Simple File Format Family (SF3) files"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/shirakumo/libsf3"
license=('zlib')
groups=()
options=()
makedepends=('doxygen' 'cmake')
source=("https://github.com/Shirakumo/$pkgname/archive/$pkgver.tar.gz")
b2sums=('59aac59a25d50942f3363f200a9b4affd338bad93c377e97dcde0ed339a01c935ab8c919f62b1f508dab485aa22f242200fe370c448efd5f9ffc4c4f11adbf61')

prepare() {
    cd "$pkgname-$pkgver"
    mkdir -p "build/"
}

build() {
    cd "$pkgname-$pkgver/build"
    cmake ".." -DBUILD_TESTER=OFF -DCMAKE_INSTALL_PREFIX:PATH=/usr
    make
}

package() {
    cd "$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir/" install
}
