# Maintainer: Maciej Sieczka <msieczka at sieczka dot org>
# Contributor: syntaxerrormmm <syntaxerrormmm (at) gmail.com>
# Contributor: SaultDon <sault.don gmail>
# Contributor: dibblethewrecker <dibblethewrecker.at.jiwe.org>

pkgname='gdal-grass'
pkgver='3.2.3'
pkgrel='1'
pkgdesc='GRASS raster and vector format support for GDAL >= 3.2.3.'
arch=('i686' 'x86_64')
url='http://www.gdal.org'
license=('X11/MIT')
source=("http://download.osgeo.org/gdal/${pkgver}/gdal-grass-${pkgver}.tar.gz")
depends=('gdal>=3.2.3' 'grass')
md5sums=('64959abe6906b2a1901ff64b31a79620')

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

