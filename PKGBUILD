# Author: Christoph Brill <aur@christophbrill.de>

_npmname=concurrently

pkgname=nodejs-concurrently
pkgver=7.1.0
pkgrel=1
pkgdesc="Run multiple commands concurrently"
arch=(any)
url="https://github.com/open-cli-tools/concurrently"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('ca51b9b058f7de54f02d5353baaa432bb2f47f1b59133f06cc2624c1682a1334')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

	# Drop strange dirs
	rm -rf "$pkgdir/usr/lib/node_modules/root"

	# Fix permissions
	find "$pkgdir/usr" -type d -exec chmod 755 {} \;
}

