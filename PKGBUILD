# Maintainer: Moritz Schoenherr <moritz.schoenherr[at]gmail[dot]com>
pkgname=crawl
pkgver=0.18.1
pkgrel=1
pkgdesc="Craw stonesoup, curses version"
url="http://crawl.develz.org/"
arch=('any')
license=('GPL2')
depends=('ncurses')
makedepends=('git')
conflicts=()
replaces=()
backup=()
source=("git://github.com/crawl/crawl.git#tag=${pkgver}")

md5sums=('SKIP')

prepare() {

	cd "${srcdir}/${pkgname}"

  	git submodule update --init

}

build() {

  cd "${srcdir}/${pkgname}/crawl-ref/source"

  make prefix="${pkgdir}/usr"
}

package() {

  cd "${srcdir}/${pkgname}/crawl-ref/source"
  
  make install prefix="${pkgdir}/usr"

}

