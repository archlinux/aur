# Maintainer: Cherio <git at mx dot cherio dot org>
# New releases: https://github.com/cherio/lease

pkgname=lease
pkgver=1.0.6
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
	"$pkgname-$pkgver-lease::$_prj_src_url/lease"
	"$pkgname-$pkgver-lease.1::$_prj_src_url/doc/lease.1"
)

sha256sums=('020d8816256d6a70c828d63b8ed5df38519a6bb6265bee68bc967a5a8cd163cd'
            'e85df862f9500864f8cf950ee98584a2fc04ce7c0806c0c4980adaa5c128719d')

package() {
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man1"
	install -m755 "./$pkgname-$pkgver-$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -m644 "./$pkgname-$pkgver-$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
