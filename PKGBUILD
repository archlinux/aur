# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=alhp-keyring
pkgver=20230504
pkgrel=3
pkgdesc='ALHP PGP keyring'
arch=(any)
url='https://somegit.dev/ALHP/alhp-keyring'
license=(GPL)
install=$pkgname.install
source=(https://f.alhp.dev/$pkgname/${pkgname}-${pkgver}.tar.gz{,.sig})
b2sums=('5420e30f8d1749ef6f247b0a0c1dc2b3b6b8ced5b3d9c26a8285c22fb1d76936503ed38cfc4c187b295e6cd3b1f88bcf8bbbd1c3f4843337f1ea69033957ce05'
        'SKIP')
validpgpkeys=('2E3B2B05A332A7DB9019797848998B4039BED1CA')  # Giovanni Harting <g.harting@mailstash.org>

package() {
  cd $pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
