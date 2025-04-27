# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=gasm80
pkgver=0.0.20250414
pkgrel=1
pkgdesc='Small, generic Z80/6502 assembler'
url=https://github.com/nanochess/gasm80
_commit=6d2e696a2d375bb98885ed559011de6bfba2fde2
arch=(x86_64)
depends=(glibc)
makedepends=(git)
license=(BSD-2-Clause)
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('ed7b668d3930ef91f7aa2983e1f660beca4e12e3ecdba5a2b6c7e91a23102bfd8cdfa16c615c8db346b0a475e281f5b3c35982c8507d125f7c7e0ebed4dfbf2c')

build () {
	cd "$pkgname"
	"${CC:-gcc}" ${CFLAGS} ${LDFLAGS} -o gasm80 gasm80.c
}

package () {
	cd "$pkgname"
	install -Dm755 -t "$pkgdir/usr/bin" gasm80
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
