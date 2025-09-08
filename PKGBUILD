# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=uz80
pkgdesc='Small and fast cross-platform Z80 assembler'
pkgver=2024.02.24
pkgrel=1
url=http://cngsoft.no-ip.org/uz80.htm
_version=${pkgver//./}
arch=(x86_64)
depends=(glibc)
license=(GPL-3.0-or-later)
source=("http://cngsoft.no-ip.org/uz80-${_version}.zip")
sha256sums=('ff19986fcb9d21f593bac3cba22c70b17255cdd804a89d0c3327bc34bbf25012')

build () {
	${CC:-gcc} ${CFLAGS} -o uz80 -xc UZ80.C ${LDFLAGS}
}

package () {
	install -Dm755 uz80 "$pkgdir/usr/bin/uz80"
	install -Dm644 UZ80.TXT "$pkgdir/usr/share/doc/$pkgname/uz80.txt"
}
