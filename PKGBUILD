# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Radoslaw Mejer <radmen@radmen.info>

pkgname=contentful-cli
pkgver=1.9.18
pkgrel=1
pkgdesc="The official Contentful command line interface"
arch=('any')
license=('MIT')
url="https://github.com/contentful/contentful-cli"
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('696fbee31805d3030acfe26e50d23ae61727b8b8eb0606593976bed7859b8f71')

package() {
	export NODE_ENV=production
	npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$pkgname-$pkgver.tgz"
	install -d "$pkgdir/usr/share/licenses/$pkgname/" "$pkgdir/usr/share/doc/$pkgname/"
	ln -s /usr/lib/node_modules/contentful-cli/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s /usr/lib/node_modules/contentful-cli/README.md "$pkgdir/usr/share/doc/$pkgname/"
	chown -R root:root "$pkgdir/"
}
