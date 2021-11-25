# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=alhp-keyring
pkgver=20211125
pkgrel=1
pkgdesc='ALHP PGP keyring'
arch=(any)
url='https://git.harting.dev/anonfunc/alhp-keyring'
license=(GPL)
install=$pkgname.install
source=(https://f.harting.dev/$pkgname/${pkgname}-${pkgver}.tar.gz{,.sig})
b2sums=('39fd6edd9b509c1520085d30cd56ad7459ad25df9e68a26ed014d3798436a87626c21250009860d0fdaa91c051cf7b1e53418cd93140b28471cbc5c516b6e5df'
        'SKIP')
validpgpkeys=('2E3B2B05A332A7DB9019797848998B4039BED1CA')  # Giovanni Harting <g.harting@mailstash.org>

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
