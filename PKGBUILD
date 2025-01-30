# Author: Mantas Mikulėnas <grawity@gmail.com>
# Contributor: Baptiste Grenier <baptiste@bapt.name>
# Maintainer: João de Felipe <joaodefelipe@gmail.com>

pkgname=igtf-trust-anchors
_pkgname=igtf-policy-installation-bundle
pkgver=1.132
pkgrel=1
pkgdesc="EUGridPMA IGTF Trust Anchor distribution"
arch=(any)
url="https://dist.igtf.net/"
source=(https://dist.igtf.net/distribution/igtf/$pkgver/$_pkgname.tar.gz{,.asc})
sha256sums=('8ad7bdf0700937c96c4c67fc2ee428231d775d49fdf913e5286486430c0e2ba4'
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
