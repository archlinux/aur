# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=svgo
pkgver=3.2.0
pkgrel=1
pkgdesc='Tool for optimizing SVG files'
arch=(any)
url="https://github.com/svg/$pkgname"
license=(MIT)
depends=(nodejs)
makedepends=(npm)
provides=(nodejs-svgo)
replaces=(nodejs-svgo)
conflicts=(nodejs-svgo)
_archive="$pkgname-$pkgver"
source=("https://registry.npmjs.org/$pkgname/-/$_archive.tgz")
noextract=("$_archive.tgz")
sha256sums=('e21ceba784118ebfd45a767d4a35b65bfcea4c743bced0ac5a3b75e7e8beb27c')

package() {
	npm install -g --prefix "$pkgdir/usr" "$_archive.tgz"
	find "$pkgdir/usr" -type d -exec chmod 755 {} +
	chown -R root:root "$pkgdir"
}
