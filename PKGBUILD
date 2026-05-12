# Maintainer: Rizki Rakasiwi <rizkirr.xyz@gmail.com>
pkgname=muslimtify
pkgver=0.2.2
pkgrel=1
pkgdesc="An Islamic prayer time notification daemon for Linux"
arch=('x86_64')
url="https://github.com/rizukirr/muslimtify"
license=('MIT')
depends=('libnotify' 'curl')
makedepends=('cmake' 'pkgconf')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fd15dee5be2cfd36ea254ea055984cedf1667a0e2960c026cab3f3cea7d0eba3')

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
