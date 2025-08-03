# Maintainer: Xtarii carlalvinelias@gmail.com

pkgname=osse-core
pkgver=0.1
pkgrel=5
pkgdesc="OpenSource Search Engine Core Library"

arch=('x86_64')
license=('Apache 2.0')

depends=()
makedepends=('cmake' 'make' 'gcc')

url="https://github.com/Xtarii/OSSE-Core"
source=("$url/archive/refs/tags/v$pkgver-$pkgrel.tar.gz")
sha256sums=('SKIP')



build() {
    echo -e "\033[33mBuilds Package...\033[0m"
    cd "OSSE-Core-$pkgver-$pkgrel"
    mkdir -p build
    cd build

    echo -e "\033[33mBuilds OSSE Core Library\033[0m"
    cmake .. -DCMAKE_BUILD_TYPE=Release
    make
    echo -e "\033[34mBuild Done\033[0m"
}

package() {
    echo -e "\033[33mInstalls Package...\033[0m"
    cd "OSSE-Core-$pkgver-$pkgrel/build"
    make DESTDIR="$pkgdir" install

    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    echo -e "\033[34mInstallation Done\033[0m"
}
