# Maintainer: Mopi <mopi@dotslashplay.it>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=play.it
pkgver=2.24.0
pkgrel=1
pkgdesc="Easy way to install games on Linux"
arch=('any')
url="https://www.dotslashplay.it"
license=('BSD')
depends=('bash')
makedepends=('pandoc')
optdepends=(
  'imagemagick: to convert images between formats'
  'libarchive: to extract various archive formats'
  'icoutils: to manipulate Windows icon files'
  'innoextract: to extract some Windows installers'
  'unzip: to extract some archives'
)
source=("${pkgname}-${pkgver}.tar.gz::https://forge.dotslashplay.it/play.it/downloads/-/raw/master/releases/${pkgver}/play.it-${pkgver}.tar.gz")
sha256sums=('5afa3d171c1cef271779fb5642916bbb65a02125628beb6d5f265a84ecb501c7')

build() {
  make
}

package() {
  make DESTDIR="$pkgdir"/ prefix=/usr bindir=/usr/bin datadir=/usr/share install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

