# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=gasm80
pkgver=0.0.20260908
pkgrel=1
pkgdesc='Small, generic Z80/6502 assembler'
url=https://github.com/nanochess/gasm80
_commit=7d08ec419157a9afbdc759ea29b67d9b486e2cb2
arch=(x86_64)
depends=(glibc)
makedepends=(git)
license=(BSD-2-Clause)
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('81a59554490b548e8eee0b590decbd4c83d055f8fe00420f12a249ceb1ac450360a0380820d4d76923c6ed4dabef897823738f42f86ff5760ada27a30287a711')

build () {
	cd "$pkgname"
	"${CC:-gcc}" ${CFLAGS} ${LDFLAGS} -o gasm80 gasm80.c
}

package () {
	cd "$pkgname"
	install -Dm755 -t "$pkgdir/usr/bin" gasm80
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
