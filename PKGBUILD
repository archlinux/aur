#Maintainer: Manjunatha Sarma Majety <manjunathasarmamajety@gmail.com>
pkgname=jrnlc
pkgver=0.2.2
pkgrel=1
pkgdesc="A fast, minimal, terminal-based journaling tool written in C++ with plain-text storage."
arch=('x86_64')
url="https://github.com/manjunathamajety/jrnlc"
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/manjunathamajety/jrnlc/archive/refs/tags/v0.2.2.tar.gz")
sha256sums=('SKIP')  # replace with actual SHA256

build() {
    cmake -S "$srcdir/$pkgname-$pkgver" -B build \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

check() {
 :
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

