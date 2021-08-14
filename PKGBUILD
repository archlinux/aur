# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=legit
pkgver=3.0.1
pkgrel=2
pkgdesc="Add licenses to projects at the command line"
arch=('any')
url='https://github.com/captainsafia/legit'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/@captainsafia/legit/-/legit-$pkgver.tgz")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('44b38be1f7f511596367c9e1eed13e5f42970bcf5289691bda60d0a2bcfd3b97')

package() {
	npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$pkgname-$pkgver.tgz"
	install -Dm 644 "$pkgdir/usr/lib/node_modules/@captainsafia/legit/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
	chown -R root:root "$pkgdir/"
}
