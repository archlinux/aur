# Maintainer: Cherio <git at mx dot cherio dot org>
# New one-run releases: https://github.com/cherio/one-run

pkgname=one-run
pkgver=1.0.2
pkgrel=1
pkgdesc="run-one drop-in alternative, command single instance runner"
arch=('x86_64')
url="https://github.com/cherio/one-run"
license=('MIT')
depends=(
	'findutils'
	'grep'
	'perl'
	'util-linux'
)
provides=("run-one")
conflicts=("run-one")
source=("$pkgname-$pkgver.tar.gz::https://github.com/cherio/$pkgname/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9b623e358361d5d08ecc8375592c6498accc3f292a244124c3afe6ad6012ea47')

package() {
	mkdir -p "$pkgdir"
	# The following installs scripts and links in $pkgdir/usr/bin as well
	# as MAN files in $pkgdir/usr/share/man/man1
	"$pkgname-$pkgver/scripts/install" -r "$pkgdir"
}
