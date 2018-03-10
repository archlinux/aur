# Author: Christoph Brill <egore911@gmail.com>

_npmname=carto

pkgname=nodejs-carto
pkgver=1.0.0
pkgrel=1
pkgdesc="Mapnik Stylesheet Compiler"
arch=(any)
url="https://github.com/mapbox/carto"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('dd3d7cd2a8f14619c400c1fd6c79b0edf76f457732b8480333e439d2370f8705')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

	mkdir -m 755 -p "$pkgdir/usr/share/vim/vimfiles"
	tar -C "$pkgdir/usr/share/vim/vimfiles" -xzf "$srcdir/$_npmname-$pkgver.tgz" package/build/vim-carto --strip-components=3
}
