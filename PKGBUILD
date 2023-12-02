# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=svgo
pkgver=3.0.3
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
sha256sums=('f0a1b5bdb54cd6623ef3cdc79ee58ce2b294955f21bc124642b4e91aa536f093')

package() {
	npm install -g --prefix "$pkgdir/usr" "$_archive.tgz"
	find "$pkgdir/usr" -type d -exec chmod 755 {} +
	chown -R root:root "$pkgdir"
}
