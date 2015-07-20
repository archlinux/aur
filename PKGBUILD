# Maintainer: TOSH <tosh@t0x0sh.org>b

pkgname=rop-tool
pkgver=2.3.1
pkgrel=2
pkgdesc="A tool to help you write binary exploits"
arch=('i686' 'x86_64')
url="https://github.com/t00sh/rop-tool"
license=('GPL3')
depends=('capstone')
source=("https://github.com/t00sh/rop-tool/archive/v$pkgver.tar.gz")
sha256sums=('f6dbb3e2cf4bd0e648af0593d2876793d99ee89a9de66d9b8d67b7a8da2453e7')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    mkdir -p $pkgdir/usr/bin
    cd "$srcdir/$pkgname-$pkgver"

    if test $CARCH == "x86_64"
    then
        install -m755 rop-tool-Linux-x86-64 $pkgdir/usr/bin/rop-tool
    else
        install -m755 rop-tool-Linux-x86 $pkgdir/usr/bin/rop-tool
    fi
}