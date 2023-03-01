# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=alhp-keyring
pkgver=20220522
pkgrel=2
pkgdesc='ALHP PGP keyring'
arch=(any)
url='https://somegit.dev/ALHP/alhp-keyring'
license=(GPL)
install=$pkgname.install
source=(https://f.alhp.dev/$pkgname/${pkgname}-${pkgver}.tar.gz{,.sig})
b2sums=('6fb02c2101b4f289c9583ac9bb55c62426b074926bfcfe249c0a6632f044ae652cf1424dc05951d42ed064167f7bd153a363c6cdcbc5300f35cf4b11ce2e765a'
        'SKIP')
validpgpkeys=('2E3B2B05A332A7DB9019797848998B4039BED1CA')  # Giovanni Harting <g.harting@mailstash.org>

package() {
  cd $pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
