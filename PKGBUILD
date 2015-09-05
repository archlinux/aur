# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: David Rosenstrauch <darose@darose.net>

set -u
pkgname='shp2text'
pkgver=1.7
pkgrel=1
pkgdesc='This utility dumps shapefiles and associated data into various formats'
arch=('any')
url='http://legacy.obviously.com/gis/shp2text/'
license=('MIT')
source=('https://github.com/Byclosure/shp2text/archive/master.zip'
        'shapefil.h')
sha256sums=('3d21deaebee8db4284d4ff1e76bd66689299481eeacbde7d8122565d208ca33a'
            '013e174d4644636ae308f91d34b4ca86a08eab738f86b7540a56dc3c74d54f8c')

prepare() {
  cd "${pkgname}-master"
  rm -f 'shapefil.h'
  cp "${srcdir}/shapefil.h" .
}

build() {
  cd "${pkgname}-master"
  make
}

package() {
  cd "${pkgname}-master"
  install -Dpm755 "${pkgname}" 'shpdiff' -t "${pkgdir}/usr/bin/"
}
set +u
