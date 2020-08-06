# Maintainer: Baptiste Grenier <baptiste@bapt.name>
pkgname=fetch-crl3
pkgver=3.0.21
pkgrel=1
pkgdesc="fetch-crl - the Certificate Revocation List retrieval tool"
arch=(any)
url="https://dist.igtf.net/distribution/util/fetch-crl3/"
license=('Apache')
depends=('perl')
source=(https://dist.eugridpma.info/distribution/util/$pkgname/fetch-crl-$pkgver.tar.gz)
md5sums=('68d9f264eec6a745d6bc4b85b2900e18')

package() {
  cd "fetch-crl-$pkgver"
  sed -i 's#/sbin#/bin#' Makefile
  make PREFIX="$pkgdir/usr" ETC="$pkgdir/etc" CACHE="$pkgdir/var/cache" install
  chmod +rx "$pkgdir/var/cache/fetch-crl"
}
