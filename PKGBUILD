# Maintainer: Cherio <git at mx dot cherio dot org>
# New releases: https://github.com/cherio/lease

pkgname=lease
pkgver=1.0.3
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
_archive="$pkgname-$pkgver"

_prj_src_url="https://raw.githubusercontent.com/cherio/lease/refs/tags/v$pkgver"
source=(
	"$_prj_src_url/lease"
	"$_prj_src_url/doc/lease.1"
)

sha256sums=('5bb6b2cadea5502d862ff4e2c427766f97b77d2b010d35dd73412c7dec8a98f1'
            '198d225cb607a381e28bcc313da8c838150e7de4bca617c48871ee2635a4a3a2')

package() {
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man1"
	install -m755 "./$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -m644 "./$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
