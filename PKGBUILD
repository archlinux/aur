# Maintainer: Cherio <git at mx dot cherio dot org>
# New one-run releases: https://github.com/cherio/one-run

pkgname=lease
pkgver=1.0.1
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
source=("$_archive.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('20e23d79a1db809782f833dc401cb3d9bd69dbc47526a11e9997e70cad163de0')

package() {
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man1"
	install -m755 "$_archive/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -m644 "$_archive/doc/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
