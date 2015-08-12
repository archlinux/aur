# Maintainer: t3ddy  <t3ddy1988 "at" gmail {dot} com>

pkgname=exif
pkgver=0.6.21
pkgrel=1
pkgdesc="A small command-line utility to show EXIF information hidden in JPEG files."
arch=(i686 x86_64)
license=('LGPL')
url="http://sourceforge.net/projects/libexif"
depends=('libexif' 'popt')
source=(http://downloads.sf.net/sourceforge/libexif/${pkgname}-${pkgver}.tar.bz2)
md5sums=('0e744471b8c3b3b1534d5af38bbf6408')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  ./configure --prefix=/usr
  
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  make DESTDIR="${pkgdir}" install
}
