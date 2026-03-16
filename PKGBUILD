# Maintainer: Rizki Rakasiwi <rizkirr.xyz@gmail.com>
pkgname=muslimtify
pkgver=0.1.5
pkgrel=1
pkgdesc="Prayer time notifier for the desktop"
arch=('x86_64')
url="https://github.com/rizukirr/muslimtify"
license=('MIT')
depends=('libnotify' 'curl')
makedepends=('cmake' 'pkgconf')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('756ae1e129f83609adaf08facb7e7c4d03839f9880979d4f77c6095e3b343673')

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
