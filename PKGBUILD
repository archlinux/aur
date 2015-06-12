# Maintainer: jose <jose1711 [at] gmail (dot) com>
# Contributor: Guillaume ALAUX <Guillaume at ALAUX dot net>

pkgname=taginfo
pkgver=1.2
pkgrel=3
pkgdesc="A quick implementation of the taglib API for use in the music jukebox program Room Juice"
arch=('i686' 'x86_64')
url="http://freshmeat.net/projects/taginfo"
license=('GPL')
depends=('taglib>=1.4')
source=(http://grecni.com/software/taginfo/${pkgname}-${pkgver}.tar.bz2)
md5sums=('b709dd6be61260c01d2bbdcb482cc1a6')
 
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}
 
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/bin"
  sed -i "s|/usr/local/bin|${pkgdir}/usr/bin|" Makefile
  make install
}
