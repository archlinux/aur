# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=gasm80
pkgdesc='Small, generic Z80/6502 assembler'
pkgver=0.0.20240820
pkgrel=2
url=https://github.com/nanochess/gasm80
_commit=04286437c44c3a2ed7f85f14e38a6874f418c8a6
arch=(x86_64)
depends=(glibc)
makedepends=(git)
license=(BSD-2-Clause)
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('cd91dea4143105616c1ee8bfdde443cd50f26b1a49155dedbc9df637c33ad621ee88bc5b5c6019599f6b92703df800a7106cd2eb5af6f37d80e4f781e003c27a')

build () {
	cd "$pkgname"
	"${CC:-gcc}" ${CFLAGS} ${LDFLAGS} -o gasm80 gasm80.c
}

package () {
	cd "$pkgname"
	install -Dm755 -t "$pkgdir/usr/bin" gasm80
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
