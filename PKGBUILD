# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=svgo
pkgver=3.3.2
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
sha256sums=('6ad8fc7f3a506d5be5b42b5ac005e0bd7155f61e0e6dc67c37552a4e054f2d2a')

package() {
	npm install -g --prefix "$pkgdir/usr" "$_archive.tgz"
	find "$pkgdir/usr" -type d -exec chmod 755 {} +
	chown -R root:root "$pkgdir"
}
