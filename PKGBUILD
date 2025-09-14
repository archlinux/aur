# Maintainer: BetaRays <betarays at changeme dot fr dot eu dot org>
# Contributor: Mopi <mopi@dotslashplay.it>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=play.it
pkgver=2.33.1
pkgrel=1
pkgdesc="Easy way to install games on Linux"
arch=('any')
url="https://www.dotslashplay.it"
license=('BSD-2-Clause')
depends=('sh')
optdepends=(
  'imagemagick: to convert images between formats'
  'libarchive: to extract various archive formats'
  'icoutils: to manipulate Windows icon files'
  'innoextract: to extract some Windows installers'
  'unzip: to extract some archives'
)
source=(
  "https://downloads.dotslashplay.it/releases/${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "https://downloads.dotslashplay.it/releases/${pkgver}/${pkgname}-${pkgver}.tar.gz.asc"
)
validpgpkeys=('72CE56ADD3F7AB42E50EF22BCD3A6DF75742FDB1')
sha256sums=(
  'bd647657c5fdb1fd0635ecd0bc510ca2e33c9fd05b696a754c43723b2e98a37e'
  'SKIP'
)

build() {
  make
}

package() {
  make DESTDIR="$pkgdir"/ prefix=/usr bindir=/usr/bin datadir=/usr/share install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
