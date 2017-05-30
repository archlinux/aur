# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>
# Contributor: Jon Sturm <jasturm002@aol.com>
# Contributor: Scott Garrett <Wintervenom@archlinux.us>

pkgname=libtifiles
pkgver=1.1.7
pkgrel=1
pkgdesc="TI File format library"
arch=('i686' 'x86_64')
url="http://lpg.ticalc.org/prj_tilp/"
license=('GPL2')
depends=('libarchive' 'libticonv')
options=('!libtool')
source=("http://downloads.sourceforge.net/project/tilp/tilp2-linux/tilp2-1.18/${pkgname}2-${pkgver}.tar.bz2")
md5sums=('69583dfb359ffdd0c2c99e57c94fea4b')

build() {
  cd "${srcdir}/${pkgname}2-${pkgver}"

  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}2-${pkgver}"

  make install DESTDIR="${pkgdir}"
}
