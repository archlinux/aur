# Maintainer: Cherio <git at mx dot cherio dot org>
# New one-run releases: https://github.com/cherio/one-run

pkgname=one-run
pkgver=1.0.5
pkgrel=1
pkgdesc="run-one drop-in alternative, command single instance runner"
arch=('x86_64')
url="https://github.com/cherio/one-run"
license=('GPL-3.0-or-later')
depends=(
	'findutils'
	'grep'
	'perl'
	'util-linux'
)
provides=("run-one")
conflicts=("run-one")
source=("$pkgname-$pkgver.tar.gz::https://github.com/cherio/$pkgname/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2c91e3c11956771c6204715637ac924f4ba40d14eb7652cef11dd749d1b2a1ab')

package() {
	mkdir -p "$pkgdir"
	# The following installs scripts and links in $pkgdir/usr/bin as well
	# as MAN files in $pkgdir/usr/share/man/man1
	"$pkgname-$pkgver/scripts/install" -r "$pkgdir"
}
