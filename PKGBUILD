# Maintainer: Maciej Sieczka <msieczka at sieczka dot org>
# Contributor: syntaxerrormmm <syntaxerrormmm (at) gmail.com>
# Contributor: SaultDon <sault.don gmail>
# Contributor: dibblethewrecker <dibblethewrecker.at.jiwe.org>

pkgname='gdal-grass'
pkgver='3.3.1'
pkgrel='1'
pkgdesc='GRASS raster and vector format support for GDAL >= 3.3.1.'
arch=('i686' 'x86_64')
url='http://www.gdal.org'
license=('X11/MIT')
source=("http://download.osgeo.org/gdal/${pkgver}/gdal-grass-${pkgver}.tar.gz")
depends=('gdal>=3.3.1' 'grass')
md5sums=('ce0482b7b9562158965582e4464e4665')

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

