# Maintainer: Yukari Hafner <shinmera@tymoon.eu>
pkgname=libsf3
pkgver=1.1
pkgrel=2
epoch=0
pkgdesc="C library to parse Simple File Format Family (SF3) files"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'riscv64')
url="https://github.com/shirakumo/libsf3"
license=('zlib')
groups=()
options=()
makedepends=('doxygen' 'cmake')
source=("https://shirakumo.org/projects/$pkgname/archive/$pkgver-b.tar.gz")
b2sums=('c4531de7574a88979b0d278768274981eb1b6393760505e2302545e7b6370ef828c85f9344f7daa90dab65a7f58f12b79724234d75da648a1bcc9d33cb6b35af')

prepare() {
    mkdir -p "$pkgname-$pkgver/build/"
}

build() {
    cmake -S "$pkgname" -B "$pkgname-$pkgver/build" -DBUILD_TESTER=OFF -DCMAKE_INSTALL_PREFIX:PATH=/usr
    cmake --build "$pkgname-$pkgver/build" -j
}

package() {
    cmake --install "$pkgname-$pkgver/build" --prefix "$pkgdir/"
}
