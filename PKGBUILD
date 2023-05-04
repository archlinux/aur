# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=alhp-keyring
pkgver=20230504
pkgrel=1
pkgdesc='ALHP PGP keyring'
arch=(any)
url='https://somegit.dev/ALHP/alhp-keyring'
license=(GPL)
install=$pkgname.install
source=(https://f.alhp.dev/$pkgname/${pkgname}-${pkgver}.tar.gz{,.sig})
b2sums=('a5d9abaac54551e4cedf8c42fbf9b336906efd962d930706d1ee0930a97c0a64bc2744e93ad594114f04e95614575444dec095d94a370cca5fcf775d3b0d7b51'
        'SKIP')
validpgpkeys=('2E3B2B05A332A7DB9019797848998B4039BED1CA')  # Giovanni Harting <g.harting@mailstash.org>

package() {
  cd $pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
