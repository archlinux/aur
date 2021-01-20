# Author: Christoph Brill <aur@christophbrill.de>

_npmname=concurrently

pkgname=nodejs-concurrently
pkgver=5.3.0
pkgrel=1
pkgdesc="Run multiple commands concurrently"
arch=(any)
url="https://github.com/kimmobrunfeldt/concurrently#readme"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('a3fbfc34a972da1dfbceb17615d2f2a7472b8d25e9c1cbf66e4039f5303f7ac3')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

	# Fix permissions
	find "$pkgdir/usr" -type d -exec chmod 755 {} \;
}

