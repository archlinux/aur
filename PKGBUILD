# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
pkgname=osm2xmap
pkgver=2.0
pkgrel=1
pkgdesc='Converter from OSM data format to OOM format'
arch=(x86_64)
url='https://github.com/sembruk/osm2xmap'
license=('GPL3')
depends=('libroxml' 'proj' 'yaml-cpp0.3')
provides=("${pkgname}=${pkgver}")
conflicts=(${pkgname}-git)
source=("https://github.com/sembruk/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8bcb5113dc0ea52da120f1bae44b47d578e50d74e524a233f9787e3820d5fa76')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir}/ install
}
