# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=gasm80
pkgver=0.0.20260110
pkgrel=1
pkgdesc='Small, generic Z80/6502 assembler'
url=https://github.com/nanochess/gasm80
_commit=287ff19ed12c236f3224f983cd7e4c822cf56b3f
arch=(x86_64)
depends=(glibc)
makedepends=(git)
license=(BSD-2-Clause)
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('4a5dac120a5507ef6155ce693c5572edbc223389500da621a31e9d5629077d01156d9a8262707f3e2a8e0191a3fec7d767734abea9c65d31674e60b52b5b7f14')

build () {
	cd "$pkgname"
	"${CC:-gcc}" ${CFLAGS} ${LDFLAGS} -o gasm80 gasm80.c
}

package () {
	cd "$pkgname"
	install -Dm755 -t "$pkgdir/usr/bin" gasm80
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
