# Maintainer: Hugo Fabresse <hugo34fabresse@gmail.com>
pkgname=dentry
pkgver=2.0.0
pkgrel=1
pkgdesc="Minimal keyboard-driven file manager for Linux"
arch=('x86_64')
url="https://github.com/Hugo-Fabresse/dentry"
license=('GPL3')
depends=('qt6-base')
makedepends=('cmake' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e822ab77dbb62f3b99e73a595b5824c13a81380b4a9d0c195b249631326b7cee')

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "$srcdir/build"
    DESTDIR="$pkgdir" cmake --install .
}

