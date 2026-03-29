# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=gasm80
pkgver=0.0.20260329
pkgrel=1
pkgdesc='Small, generic Z80/6502 assembler'
url=https://github.com/nanochess/gasm80
_commit=3f736b0a9d20f4773e8acbbb6b83517a378d2443
arch=(x86_64)
depends=(glibc)
makedepends=(git)
license=(BSD-2-Clause)
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('3009f9a1d06d97938bf9e7e7aa74d28e0e89f53842ccfa4d29936dc022340933a80dc9f7cae36628b079dcb02e8ca3b7a478eb459edb8d0a4b1605140cbcdfb4')

build () {
	cd "$pkgname"
	"${CC:-gcc}" ${CFLAGS} ${LDFLAGS} -o gasm80 gasm80.c
}

package () {
	cd "$pkgname"
	install -Dm755 -t "$pkgdir/usr/bin" gasm80
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
