# Maintainer: Mantas Mikulėnas <grawity@gmail.com>

pkgname=igtf-trust-anchors
_pkgname=igtf-policy-installation-bundle
pkgver=1.79
pkgrel=1
pkgdesc="EUGridPMA IGTF Trust Anchor distribution"
arch=(any)
url="https://dist.igtf.net/"
source=(https://dist.eugridpma.info/distribution/current/$_pkgname-$pkgver.tar.gz{,.asc})
sha256sums=('2442c46e7b9e8750a7b453e61d6049b4475699f3c0a91679f5b78648b5642cdd'
            'SKIP')
validpgpkeys=('D12E922822BE64D50146188BC32D99C83CDBBC71')

build() {
  cd "$_pkgname-$pkgver"
  ./configure --prefix="$pkgdir/etc/grid-security/certificates" \
              --with-install="install -m 644"                   \
              --with-profile="all-accredited"                   ;
}

package() {
  cd "$_pkgname-$pkgver"
  make install
}

# vim: ft=sh:ts=2:sw=2:et
