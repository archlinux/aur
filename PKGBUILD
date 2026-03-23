# Maintainer: Hugo Fabresse <hugo34fabresse@gmail.com>
pkgname=dentry
pkgver=1.2.0
pkgrel=1
pkgdesc="Minimal keyboard-driven file manager for Linux"
arch=('x86_64')
url="https://github.com/Hugo-Fabresse/dentry"
license=('GPL3')
depends=('qt6-base')
makedepends=('cmake' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('079194c994fcd45e7c0e9445b971681fe0aa5cca2c084e5077167bddd360c4d1')

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

