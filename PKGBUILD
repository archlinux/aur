# Maintainer: flying sheep <flying-sheep@web.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_name=jsdoc
pkgname=nodejs-$_name
pkgver=3.6.11
pkgrel=1
pkgdesc='An API documentation generator for JavaScript'
url="https://github.com/jsdoc3/$_name"
arch=(any)
license=(APACHE)
depends=(nodejs)
makedepends=(npm)
source=("https://registry.npmjs.org/$_name/-/$_name-$pkgver.tgz")
sha256sums=('0edcddc7ad9b76d4728ad91b4464362e7fe46d0f11a05e2aab9b1a44686a7664')

build() {
	cd "$srcdir/package"
	npm --cache "$srcdir/npm-cache" install
	npm pack
}

package() {
	npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$srcdir/package/jsdoc-$pkgver.tgz"
	chown -R root:root "$pkgdir/"*
}
