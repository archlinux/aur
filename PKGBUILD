# Maintainer: Maciej Sieczka <msieczka at sieczka dot org>
# Contributor: syntaxerrormmm <syntaxerrormmm (at) gmail.com>
# Contributor: SaultDon <sault.don gmail>
# Contributor: dibblethewrecker <dibblethewrecker.at.jiwe.org>

pkgname='gdal-grass'
pkgver='2.1.0'
pkgrel='1'
pkgdesc='GRASS raster and vector format support for GDAL 2.1.x.'
arch=('i686' 'x86_64')
url='http://www.gdal.org'
license=('X11/MIT')
source=("http://download.osgeo.org/gdal/${pkgver}/gdal-grass-${pkgver}.tar.gz")
depends=('gdal>=2.1.0' 'grass7')
md5sums=('a272099fc145db1e5e7837a96e4e6691')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure \
    --prefix=/${pkgdir}/usr \
    --with-grass=/opt/grass7 \
    --with-autoload=${pkgdir}/usr/lib/gdalplugins
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/share/gdal/grass"
  make install
}

