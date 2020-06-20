# Maintainer: suliman altassan <suliman.p2019@gmail.com>

pkgname=alif
pkgver=2.0.14
pkgrel=2
pkgdesc="The Alif Arabic Programming Language - لغة البرمجة العربية ألف"
arch=('x86_64')
url="https://www.aliflang.org/"
license=('GPL3')
depends=('boost')
source=("git+https://github.com/hassandraga/alif.git")
md5sums=('SKIP')

build() {
    cd "$srcdir/alif"
    git clone https://github.com/sulimanp/alif-pkg.git
    g++ -m64 -std=c++11 -Wl,--as-needed -finput-charset=utf-8 -Wall -fexceptions -O2 -Os -s -DLINUX -Wl,--gc-sections -Wl,--hash-style=both -Wl,-Bstatic -static -static-libgcc -static-libstdc++ -Wunused-but-set-variable -I"/usr/local/include/aliflibwx" -I"Src" "compiler/src/alif.cpp" -o "alif"
}

package() {
    mkdir -p "$pkgdir/usr/bin/"
    cp "$srcdir/$pkgname/alif" "$pkgdir/usr/bin/"
    cp "$srcdir/$pkgname/alif-pkg/usr" "$pkgdir/" -rv
}
