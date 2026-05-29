# Maintainer: Cherio <git at mx dot cherio dot org>
# New one-run releases: https://github.com/cherio/one-run

pkgname=lease
pkgver=1.0.2
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
sha256sums=('bd16d7a943f45965a27c40ffa62a28e796cca5f781a7bbd1ddfab8e2793d0554')

package() {
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man1"
	install -m755 "$_archive/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -m644 "$_archive/doc/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
