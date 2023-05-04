# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=alhp-keyring
pkgver=20230504
pkgrel=4
pkgdesc='ALHP PGP keyring'
arch=(any)
url='https://somegit.dev/ALHP/alhp-keyring'
license=(GPL)
install=$pkgname.install
source=(https://f.alhp.dev/$pkgname/${pkgname}-${pkgver}.tar.gz{,.sig})
b2sums=('7c07bf6ceef73f8b6707e35714625e4613df5eae9f79d6fb494317a1eccd2613c20dba292c964a136fd4a7e78c0db970b779cc8281dd565dffd49734d9f46dd2'
        'SKIP')
validpgpkeys=('2E3B2B05A332A7DB9019797848998B4039BED1CA')  # Giovanni Harting <g.harting@mailstash.org>

package() {
  cd $pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
