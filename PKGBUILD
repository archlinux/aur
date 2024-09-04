# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=gasm80
pkgver=0.0.20240824
pkgrel=1
pkgdesc='Small, generic Z80/6502 assembler'
url=https://github.com/nanochess/gasm80
_commit=50a02dd2d7a928af2c7e02ab6eda66e1770de428
arch=(x86_64)
depends=(glibc)
makedepends=(git)
license=(BSD-2-Clause)
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('389198ac9ba2d8995c1e0d40e1861959ea0c55ad721dc5f56baf4ba52e01619484218e4447eab608344f92ddadaef61ab24ddd45cd2dbb5c9b1f8a33ba0c9781')

build () {
	cd "$pkgname"
	"${CC:-gcc}" ${CFLAGS} ${LDFLAGS} -o gasm80 gasm80.c
}

package () {
	cd "$pkgname"
	install -Dm755 -t "$pkgdir/usr/bin" gasm80
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
