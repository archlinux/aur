# Maintainer: Maciej Sieczka <msieczka at sieczka dot org>
# Contributor: syntaxerrormmm <syntaxerrormmm (at) gmail.com>
# Contributor: SaultDon <sault.don gmail>
# Contributor: dibblethewrecker <dibblethewrecker.at.jiwe.org>

pkgname='gdal-grass'
pkgver='1.0.2'
pkgrel='1'
pkgdesc='GRASS raster and vector format support for GDAL.'
arch=('i686' 'x86_64')
url='http://www.gdal.org'
license=('X11/MIT')
source=("https://github.com/OSGeo/gdal-grass/archive/refs/tags/${pkgver}.tar.gz")
depends=('gdal' 'grass')
md5sums=('08070601b6701f7f86b114e9b29f5c4d')

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

