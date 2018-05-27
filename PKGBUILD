# Maintainer: Jamie Nadeau <james2432 at gmail dot com>
pkgname=tippecanoe
pkgver=1.29.0
pkgrel=1
pkgdesc="Builds vector tilesets from large (or small) collections of GeoJSON features"
arch=('i686' 'x86_64')
url="https://github.com/mapbox/tippecanoe"
license=('BSD')
groups=()
depends=()
makedepends=()
optdepends=()
provides=('tippecanoe')
backup=()
options=()
install=''
source=("https://github.com/mapbox/tippecanoe/archive/1.29.0.tar.gz")
md5sums=('1faf55dd7f3ed5a5d557708c9bd658b3')

build() {
  cd "$pkgname-$pkgver"

  make tippecanoe tippecanoe-enumerate tippecanoe-decode tile-join
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/man/man1

  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cp tippecanoe "$pkgdir"/usr/bin/tippecanoe
  cp tippecanoe-enumerate "$pkgdir"/usr/bin/tippecanoe-enumerate
  cp tippecanoe-decode "$pkgdir"/usr/bin/tippecanoe-decode
  cp tile-join "$pkgdir"/usr/bin/tile-join
  cp man/tippecanoe.1 "$pkgdir"/usr/share/man/man1/tippecanoe.1
  
}

