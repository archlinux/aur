# Maintainer: Jon Noble <jonnobleuk@gmail.com>
pkgname=tinypngout
pkgver=1
pkgrel=2
pkgdesc="Tiny PNG Output is a small standalone library which takes RGB8.8.8 pixels and writes a PNG file."
arch=(x86_64)
url="https://www.nayuki.io/page/tiny-png-output"
license=('LGPL3 or any later version')
groups=()
depends=()
makedepends=() 
provides=("${pkgname%}")
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://www.nayuki.io/res/tiny-png-output/TinyPngOut-cpp.zip")
noextract=()
md5sums=('5a4b3d70a1e2bb9aa1ad15537c597e59')


prepare() {
    unzip -o "TinyPngOut-cpp.zip"
}

build() {
    g++ -O2 -g0 -std=c++11 -fPIC -c TinyPngOut.cpp -o tinypngout.o
    gcc -shared tinypngout.o -o libTinyPngOut.so
}


package() {
    mkdir -p ${pkgdir}/usr/lib/
    mkdir -p ${pkgdir}/usr/include/TinyPngOut/
    cp libTinyPngOut.so ${pkgdir}/usr/lib/
    cp TinyPngOut.hpp ${pkgdir}/usr/include/TinyPngOut/
}
