# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>

pkgname=clocker
pkgver=1.20.4
pkgrel=1
pkgdesc='Tracks project hours'
arch=('any')
url="https://github.com/substack/clocker"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('bbf0df9fa665fec4afbe610a6e7122a1310f2e7a99f7c35c469b68de76b67c12')

package() {
	npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$pkgname-$pkgver.tgz"
	install -Dm644 "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "$pkgdir/usr/lib/node_modules/$pkgname/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
	rm "$pkgdir/usr/lib/node_modules/$pkgname/"{LICENSE,README.md}
	rm -rf "$pkgdir/usr/lib/node_modules/$pkgname/node_modules/leveldown/prebuilds/"
	chown -R root:root "$pkgdir/"
}
