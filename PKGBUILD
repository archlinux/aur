# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=gasm80
pkgdesc='Small, generic Z80 assembler'
pkgver=0.0.20240601
pkgrel=2
url=https://github.com/nanochess/gasm80
_commit=c1dd0a7df5673e2932dac6a6155a7686b4bf398b
arch=(x86_64)
depends=(glibc)
makedepends=(git)
license=(BSD-2-Clause)
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('2ad588bb94052abc3a6ab8a7b159677438649c6160633abbce1ab36f747c4fa7e17ecded5c6741cfb0941ee08a0e6d9e9c913c2f48b08ca8605b6f3a78fe47b0')

build () {
	cd "$pkgname"
	"${CC:-gcc}" ${CFLAGS} ${LDFLAGS} -o gasm80 gasm80.c
}

package () {
	cd "$pkgname"
	install -Dm755 -t "$pkgdir/usr/bin" gasm80
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
