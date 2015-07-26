# Maintainer: TOSH <tosh@t0x0sh.org>b

pkgname=rop-tool
pkgver=2.4
pkgrel=1
pkgdesc="A tool to help you write binary exploits"
arch=('i686' 'x86_64')
url="https://github.com/t00sh/rop-tool"
license=('GPL3')
depends=('capstone')
source=("https://github.com/t00sh/rop-tool/archive/v$pkgver.tar.gz")
sha256sums=('24fbffa8fb78effa0bd5007927b27275f6d3601db3152865f879d15c01a0d94a')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    mkdir -p $pkgdir/usr/bin
    cd "$srcdir/$pkgname-$pkgver"

    if test $CARCH == "x86_64"
    then
        install -m755 rop-tool-Linux-x86_64 $pkgdir/usr/bin/rop-tool
    else
        install -m755 rop-tool-Linux-i686 $pkgdir/usr/bin/rop-tool
    fi
}
