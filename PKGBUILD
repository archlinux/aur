# Maintainer: t3ddy  <t3ddy1988 "at" gmail {dot} com>

pkgname=exif
pkgver=0.6.22
pkgver_=${pkgver//./_}
pkgrel=1
pkgdesc="A small command-line utility to show EXIF information hidden in JPEG files."
arch=(i686 x86_64)
license=('LGPL')
url="https://github.com/libexif/exif/releases"
depends=('libexif' 'popt')
source=(https://github.com/libexif/exif/releases/download/${pkgname}-${pkgver_}-release/${pkgname}-${pkgver}.tar.xz)
md5sums=('bc600b12c50fbb26f025819164d963e6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  ./configure --prefix=/usr
  
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  make DESTDIR="${pkgdir}" install
}
