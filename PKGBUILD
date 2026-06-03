# Maintainer: Cherio <git at mx dot cherio dot org>
# New releases: https://github.com/cherio/lease

pkgname=lease
pkgver=1.0.4
pkgrel=1
pkgdesc="A FIFO semaphore utility that manages resource ownership by processes"
arch=('x86_64')
url="https://github.com/cherio/lease"
license=('MIT')
depends=(
	'perl'
)
provides=("lease")
conflicts=("lease")

_prj_src_url="https://raw.githubusercontent.com/cherio/lease/refs/tags/v$pkgver"
source=(
	"$_prj_src_url/lease"
	"$_prj_src_url/doc/lease.1"
)

sha256sums=('9278071825ca089d4e0f888ad7e149b710194df56bcd764d674e14c5a8a20f10'
            '148682e54d59eaf7b05df90ea9377cbb8549b875dfb14d08034e16d19cf92837')

package() {
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man1"
	install -m755 "./$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -m644 "./$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
