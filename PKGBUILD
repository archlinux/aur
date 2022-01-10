# Contributor: dreieck
# Contributor: Nikolay Korotkiy <sikmir@gmail.com>

pkgname=osmctools
pkgver=0.9
pkgrel=2
pkgdesc='Command line tools for transforming Open Street Map files'
arch=(x86_64)
url='https://gitlab.com/osm-c-tools/osmctools'
license=('AGPL3')
provides=('osmconvert' 'osmfilter' 'osmupdate')
conflicts=('osmconvert' 'osmfilter' 'osmupdate')
source=("https://gitlab.com/osm-c-tools/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2f5298be5b4ba840a04f360c163849b34a31386ccd287657885e21268665f413')

prepare() {
  cd ${pkgname}-${pkgver}
  autoreconf --install
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
