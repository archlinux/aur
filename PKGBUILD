# Maintainer: Hugo Hörnquist <hugo@lysator.liu.se>

pkgname=guile-gumbo
pkgver=0.10.1_0.2
pkgrel=1
pkgdesc='Guile bindings for the Gumbo HTML5 parser'
arch=(any)
license=(Apache)
depends=('guile>=2.2' 'gumbo-parser>=0.10')
url=https://git.lysator.liu.se/hugo/guile-gumbo
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('0b1b0c04f16be5d05518e191bba4bbd9')

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
