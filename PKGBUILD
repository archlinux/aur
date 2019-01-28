# Author: Christoph Brill <egore911@gmail.com>

_npmname=carto

pkgname=nodejs-carto
pkgver=1.2.0
pkgrel=1
pkgdesc="Mapnik Stylesheet Compiler"
arch=(any)
url="https://github.com/mapbox/carto"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('1d7176e694a04da66834f6cbf80ee6b18d66761a60d12cbd386c5d3fe1cdb6f2')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

	mkdir -m 755 -p "$pkgdir/usr/share/vim/vimfiles"
	tar -C "$pkgdir/usr/share/vim/vimfiles" -xzf "$srcdir/$_npmname-$pkgver.tgz" package/build/vim-carto --strip-components=3

	# Fix permissions
	find "$pkgdir/usr" -type d -exec chmod 755 {} \;
}
