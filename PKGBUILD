# Maintainer: Yukari Hafner <shinmera@tymoon.eu>
pkgname=libsf3
pkgver=1.0
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
b2sums=('90cdde4e7e5344053cb8b23232daa68864ba891dcedfc22003f434f8c063f8dd84cfa74cdcf335311e4c0a0334205fc25a07bb545120c0623aa3ad071aabfd71')

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
