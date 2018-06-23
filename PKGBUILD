# Author: Christoph Brill <egore911@gmail.com>

_npmname=carto

pkgname=nodejs-carto
pkgver=1.0.1
pkgrel=1
pkgdesc="Mapnik Stylesheet Compiler"
arch=(any)
url="https://github.com/mapbox/carto"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('5f9a184d1f45d85d4a6ae1e290d511a3ba30833e54fed7ae5f15c8a4d55e4845')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

	mkdir -m 755 -p "$pkgdir/usr/share/vim/vimfiles"
	tar -C "$pkgdir/usr/share/vim/vimfiles" -xzf "$srcdir/$_npmname-$pkgver.tgz" package/build/vim-carto --strip-components=3
}
