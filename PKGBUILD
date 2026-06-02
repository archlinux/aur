# Maintainer: ChickenJockey7
pkgname=squish
pkgver=1.1.0
pkgrel=1
pkgdesc="A unix based shell written in cpp"
arch=('x86_64')
url="https://gitlab.com/cpp4692517/shell"
license=('MIT')
makedepends=('git' 'cmake' 'make' 'gcc')
depends=('lua')
source=("git+https://gitlab.com/cpp4692517/shell.git")
sha256sums=('SKIP')

build() {
    cd shell
    cmake -B build -DCMAKE_BUILD_TYPE=Release
    cmake --build build 2>/dev/null
}

package() {
    cd shell
    DESTDIR="$pkgdir" cmake --install build
}
