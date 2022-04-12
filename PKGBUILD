# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neoss
pkgver=1.1.3
pkgrel=1
pkgdesc="Unix tool with terminal UI for visualizing socket statistics"
arch=('any')
url='https://github.com/pablolec/neoss'
license=('BSD')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('0b6cb3ba5442bd1ba89efd3add3254a2a5be178eca5d8470cf98004b7525ef51')

PURGE_TARGETS=(*.gif *.yml)

package() {
	npm install -g --prefix "$pkgdir/usr" --cache npm-cache "$pkgname-$pkgver.tgz"
	chown -R root:root "$pkgdir/"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "/usr/lib/node_modules/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
