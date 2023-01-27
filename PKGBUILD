# Maintainer: Jake Bailey <pkgbuilds at jakebailey dot xyz>

pkgname=disk-burnin-and-testing-git
_pkgname=${pkgname%-git}
pkgver=1.1.0.r2.g66c5bb6
pkgrel=1
pkgdesc="Shell script for burn-in and testing of new or re-purposed drives"
arch=('any')
url="https://github.com/Spearfoot/disk-burnin-and-testing"
license=('MIT')
depends=(e2fsprogs smartmontools)
optdepends=('inetutils: for hostname logging')
source=("git+https://github.com/Spearfoot/disk-burnin-and-testing.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir"

	install -D -m644 "$_pkgname/license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D -m755 "$_pkgname/disk-burnin.sh" "$pkgdir/usr/bin/disk-burnin"
}
