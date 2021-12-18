# Maintainer: flying sheep <flying-sheep@web.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_name=jsdoc
pkgname=nodejs-$_name
pkgver=3.6.7
pkgrel=1
pkgdesc='An API documentation generator for JavaScript'
url='https://github.com/jsdoc3/$_name'
arch=(any)
license=(APACHE)
depends=(nodejs)
makedepends=(npm)
source=("https://registry.npmjs.org/$_name/-/$_name-$pkgver.tgz")
sha256sums=('c081fb764e73565c2fbc5cfb559c3d0a6a3d82d337dcf146ece76a2ea17b99b8')

build() {
	cd "$srcdir/package"
	npm --cache "$srcdir/npm-cache" install
	npm pack
}

package() {
	npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$srcdir/package/jsdoc-$pkgver.tgz"
	chown -R root:root "$pkgdir/"*
}
