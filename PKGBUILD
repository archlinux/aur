# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

_npmname=htmlhint
pkgname=nodejs-htmlhint
pkgver=0.9.7
pkgrel=1
pkgdesc="Static Code Analysis Tool for HTML, you can use it with IDE or in build system."
arch=(any)
url="http://htmlhint.com/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('23b7df7531b1a0876c6724fb1e5e25990a0eec0153978ec4fed5d6e280759f71')

package() {
	npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$pkgver.tgz
	rm -rf "$pkgdir"/usr/etc
	chmod -R go-w "$pkgdir"
	install -Dm0644 "$pkgdir"/usr/lib/node_modules/htmlhint/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}
