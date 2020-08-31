# Author: Mantas Mikulėnas <grawity@gmail.com>
# Maintainer: Baptiste Grenier <baptiste@bapt.name>

pkgname=igtf-trust-anchors
_pkgname=igtf-policy-installation-bundle
pkgver=1.107
pkgrel=1
pkgdesc="EUGridPMA IGTF Trust Anchor distribution"
arch=(any)
url="https://dist.igtf.net/"
source=(https://dist.eugridpma.info/distribution/current/$_pkgname-$pkgver.tar.gz{,.asc})
sha256sums=('6f1cdc1b04e437a7b77e964c3b0bb85a87807fbd78cff9f77196823fb15ffbed'
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
