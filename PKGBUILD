# Maintainer: nezbednik <nezbedniklmao at gmail dot com>
pkgname=length-cpp
pkgver=1.0.0
pkgrel=3
pkgdesc="length interpreter (C++)"
url="https://github.com/nezbednik/length-cpp"
arch=("any")
makedepends=("gcc")
source=("https://github.com/nezbednik/length-cpp/archive/016c37d877c481d4f03870fe0c9a2471e76b5241.zip")
sha256sums=("d61e2414c8f369cf5264ada06ff91e6ec3414368b10bab23143f129c8e5f00ed")

build() {
    cd "$srcdir"
    cd length-cpp-*
    g++ -O2 -s -DNDEBUG length.h main.cpp -o ../length-cpp
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    install --mode=755 "$srcdir/length-cpp" "$pkgdir/usr/bin"
}
