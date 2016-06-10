# Maintainer: mar77i <mar77i at mar77i dot ch>
pkgname="opennic-git"
pkgver=v0.1.r1.g0f1fef7
pkgrel=1
pkgdesc="opennic DNS service"
arch=(any)
url="https://github.com/mar77i/opennic"
license=(custom:ISC)
depends=(curl)
makedepends=(git)
provides=(opennic)
conflicts=(opennic)
source=("git+https://github.com/mar77i/opennic.git")
sha1sums=(SKIP)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	:
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 opennic.sh "$pkgdir/usr/bin/opennic"
	install -Dm644 "opennic.service" "$pkgdir/usr/lib/systemd/system/opennic.service"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
