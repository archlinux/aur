# Maintainer: flying sheep <flying-sheep@web.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=nodejs-jsdoc
pkgver=3.5.5
pkgrel=2
pkgdesc='An API documentation generator for JavaScript'
url='https://github.com/jsdoc3/jsdoc'
arch=(any)
license=(APACHE)
depends=(nodejs)
makedepends=(npm)
source=("https://registry.npmjs.org/jsdoc/-/jsdoc-$pkgver.tgz")
md5sums=('50026a112a0adcc8d1413ab838f76fe6')

build() {
	cd "$srcdir/package"
	npm install
	npm pack
}

package() {
	npm install "$srcdir/package/jsdoc-$pkgver.tgz" -g --user root --prefix "$pkgdir/usr"
}
