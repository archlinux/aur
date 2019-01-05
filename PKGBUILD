# Maintainer: Matthew Taylor <mtaylor1252dev@gmail.com>

pkgname=cdynarr
pkgver=0.3.0
pkgrel=1
pkgdesc="C library implementing dynamic arrays."
arch=("x86_64")
url="https://gitlab.com/ymber/cdynarr"
license=("MIT")
source=(https://gitlab.com/ymber/cdynarr/-/archive/0.3.0/cdynarr-0.3.0.tar.bz2)
sha256sums=("53e652fc8a10753ee37f904ca33298dae4dd5fe78cd388d889641f3f11bf6515")

build() {
    cd $srcdir/$pkgname-$pkgver
    make CC=gcc release
}

package() {
    cd $srcdir/$pkgname-$pkgver
    install -Dm644 build/release/libcdynarr.a $pkgdir/usr/lib/libcdynarr.a
    install -Dm644 src/cdynarr.h $pkgdir/usr/include/$pkgname/cdynarr.h
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

