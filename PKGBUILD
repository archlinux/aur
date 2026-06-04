# Maintainer: Cherio <git at mx dot cherio dot org>
# New releases: https://github.com/cherio/lease

pkgname=lease
pkgver=1.0.5
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

sha256sums=('9b0f52f40aa8e995f20d597fcda8de09a38263e7875d302158c59fc1389646d8'
            'f0d8e736c42b0aa7fe1a43a9b0ac54b60506415a97d257ea4c8d8b9f9e88885b')

package() {
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man1"
	install -m755 "./$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -m644 "./$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
