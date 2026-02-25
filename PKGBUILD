# Maintainer: Rizki Rakasiwi <rizkirr.xyz@gmail.com>
pkgname=muslimtify
pkgver=0.1.1
pkgrel=1
pkgdesc="Prayer time notifier for the desktop"
arch=('x86_64')
url="https://github.com/rizukirr/muslimtify"
license=('MIT')
depends=('libnotify' 'curl')
makedepends=('cmake' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')  # replace with actual sha256

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
