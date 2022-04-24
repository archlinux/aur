# Maintainer: Hugo Hörnquist <hugo@lysator.liu.se>

pkgname=guile-gumbo
pkgver=0.10.1_0.5
pkgrel=1
pkgdesc='Guile bindings for the Gumbo HTML5 parser'
arch=(any)
license=(Apache)
depends=('guile>=2.2' 'gumbo-parser>=0.10')
url=https://git.lysator.liu.se/hugo/guile-gumbo
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('43c4db30a8ff9b823543c868d3c687e7')

build(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR=$pkgdir install
}
