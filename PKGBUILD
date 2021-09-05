# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=foy
pkgver=0.2.12
pkgrel=1
pkgdesc="Simple, lightweight and modern task runner for general purpose"
arch=('any')
url='http://zaaack.github.io/foy'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('2ff7dd0efffea6da9a8b0b5185e01488b93ace8866a698263f67220b3254c62c')

package() {
	npm install -g --production --cache-dir=npm-cache --prefix="$pkgdir/usr" "$pkgname-$pkgver.tgz"
	install -Dm 644 "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 "$pkgdir/usr/lib/node_modules/$pkgname/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
	chown -R root:root "$pkgdir/"
}
