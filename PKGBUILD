# Author: Christoph Brill <aur@christophbrill.de>

_npmname=concurrently

pkgname=nodejs-concurrently
pkgver=6.2.1
pkgrel=1
pkgdesc="Run multiple commands concurrently"
arch=(any)
url="https://github.com/open-cli-tools/concurrently"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('93ed2d394c3f3f35ae069074899498416fe21d0eab9a6205ca823ef72a7923c1')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

	# Drop strange dirs
	rm -rf "$pkgdir/usr/lib/node_modules/root"

	# Fix permissions
	find "$pkgdir/usr" -type d -exec chmod 755 {} \;
}

