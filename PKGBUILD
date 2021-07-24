# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Radoslaw Mejer <radmen@radmen.info>

pkgname=contentful-cli
pkgver=1.8.21
pkgrel=1
pkgdesc="The official Contentful command line interface"
arch=('any')
license=('MIT')
url="https://github.com/contentful/contentful-cli"
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('47307e01e0e3c8b79582cd2d41babf230f3e5f5df155f8bfdcae3c30af9d9c0d')

package() {
	export NODE_ENV=production
	npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$pkgname-$pkgver.tgz"
	install -d "$pkgdir/usr/share/licenses/$pkgname/" "$pkgdir/usr/share/doc/$pkgname/"
	ln -s /usr/lib/node_modules/contentful-cli/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s /usr/lib/node_modules/contentful-cli/README.md "$pkgdir/usr/share/doc/$pkgname/"
	chown -R root:root "$pkgdir/"
}
