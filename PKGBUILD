# Maintainer: Maciej Sieczka <msieczka at sieczka dot org>
# Contributor: syntaxerrormmm <syntaxerrormmm (at) gmail.com>
# Contributor: SaultDon <sault.don gmail>
# Contributor: dibblethewrecker <dibblethewrecker.at.jiwe.org>

pkgname='gdal-grass'
pkgver='3.0.4'
pkgrel='1'
pkgdesc='GRASS raster and vector format support for GDAL >= 3.0.4.'
arch=('i686' 'x86_64')
url='http://www.gdal.org'
license=('X11/MIT')
source=("http://download.osgeo.org/gdal/${pkgver}/gdal-grass-${pkgver}.tar.gz")
depends=('gdal>=3.0.4' 'grass')
md5sums=('f7a21fff374e0a2b0390f8e0b33a8ca0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure \
    --prefix=${pkgdir}/usr \
    --with-grass=/opt/grass \
    --with-autoload=${pkgdir}/usr/lib/gdalplugins
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/share/gdal/grass"
  make install
}

