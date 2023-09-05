# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=m68kdis
pkgdesc='Portable standalone Motorola MC680x0 disassembler'
pkgver=0.20181202
pkgrel=2
_commit=27d1528fb8b84f33a073301e327d71831cfd2639
arch=(x86_64)
license=(custom)
depends=(glibc)
makedepends=(git)
url=https://github.com/cr1901/m68kdis
source=("$pkgname::git+$url#commit=$_commit")
b2sums=(SKIP)

build () {
    make -C "$pkgname" CFLAGS="$CFLAGS -D_ANSI_C_SOURCE" LIBS="$LDFLAGS -lm"
}

package () {
    install -Dm755 "$pkgname/m68kdis" "$pkgdir/usr/bin/m68kdis"
    install -Dm644 "$pkgname/m68kdis.1" "$pkgdir/usr/share/man/man1/m68kdis.1"
}
