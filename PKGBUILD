# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_npmname=concurrently
pkgname=nodejs-concurrently
pkgver=9.0.1
pkgrel=1
pkgdesc="Run multiple commands concurrently"
arch=(any)
url="https://github.com/open-cli-tools/concurrently"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('c9f5d8cfb813ab049e1e01f10719832049b6f00e4df3658da27590f43f185fb9')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

	# Drop strange dirs
	rm -rf "$pkgdir/usr/lib/node_modules/root"

	# Fix permissions
	find "$pkgdir/usr" -type d -exec chmod 755 {} \;
}
