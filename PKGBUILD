# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=m68kdis
pkgdesc='Portable standalone Motorola MC680x0 disassembler'
pkgver=0.20260905
pkgrel=1
_commit=40edb81b42626100d23c9bd104417d3f9be71195
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
