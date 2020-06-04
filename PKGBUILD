# Maintainer: suliman altassan <suliman.p2019@gmail.com>

pkgname=alif
pkgver=2.0.12
pkgrel=1
pkgdesc="The Alif Arabic Programming Language - لغة البرمجة العربية ألف"
arch=('x86_64')
url="https://www.aliflang.org/"
license=('GPL3')
depends=('boost')
source=('https://github.com/sulimanp/alif/archive/master.zip')
md5sums=('8ec6e8b1c6de29b2489a75e32c7ecc7c')

build() {
    cd "$srcdir/alif-master"
    g++ -m64 -std=c++11 -Wl,--as-needed -finput-charset=utf-8 -Wall -fexceptions -O2 -Os -s -DLINUX -Wl,--gc-sections -Wl,--hash-style=both -Wl,-Bstatic -static -static-libgcc -static-libstdc++ -Wunused-but-set-variable -I"/usr/local/include/aliflibwx" -I"Src" "compiler/alif.cpp" -o "alif"
}

package() {
    mkdir -p "$pkgdir/usr/bin/"
    cp "$srcdir/alif-master/alif" "$pkgdir/usr/bin/"
    cp "$srcdir/alif-master/arch-linux-build/usr" "$pkgdir/" -rf
}
