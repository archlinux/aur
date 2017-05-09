# Author: Christoph Brill <egore911@gmail.com>

_npmname=carto

pkgname=nodejs-carto
pkgver=0.17.3
pkgrel=2
pkgdesc="Mapnik Stylesheet Compiler"
arch=(any)
url="https://github.com/mapbox/carto"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('0982baab13dcc9a8943d2db7ab31024b993cdd2d64f065b7442198d0c618d74a')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

	mkdir -m 755 -p "$pkgdir/usr/share/vim/vimfiles"
	tar -C "$pkgdir/usr/share/vim/vimfiles" -xzf "$srcdir/$_npmname-$pkgver.tgz" package/build/vim-carto --strip-components=3
}
