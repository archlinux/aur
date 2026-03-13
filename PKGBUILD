# Maintainer: Hugo Fabresse <hugo34fabresse@gmail.com>
pkgname=dentry
pkgver=1.0.0
pkgrel=1
pkgdesc="Minimal keyboard-driven file manager for Linux"
arch=('x86_64')
url="https://github.com/Hugo-Fabresse/dentry"
license=('GPL3')
depends=('qt6-base')
makedepends=('cmake' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d5d1fa120d06abf9a811f7dd66a8cbad4b47b33c6950bea7a46551a44b4eb2f5')

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

