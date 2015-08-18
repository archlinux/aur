# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Michael Kanis <mkanis gmx de>
# Contributor: Paulo Freire <paulofreire gmail com>
# Contributor: Brice Maron <brice bmaron net>

pkgname=merkaartor
pkgver=0.18.2
pkgrel=1
pkgdesc='OpenStreetMap editor'
url='http://merkaartor.be/'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('desktop-file-utils' 'exiv2' 'gdal' 'hicolor-icon-theme' 'qtwebkit')
optdepends=('gpsd' 'libproxy')
install="$pkgname.install"
source=("https://github.com/openstreetmap/merkaartor/archive/$pkgver.tar.gz")
sha256sums=('9e04d554ebc4f9999d0dd6d0cdf4e50a38135f34ded68f5dfd8cb295e20bf508')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake Merkaartor.pro \
    PREFIX="/usr" \
    NODEBUG=1 \

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
