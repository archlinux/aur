# Author: Mantas Mikulėnas <grawity@gmail.com>
# Maintainer: Baptiste Grenier <baptiste@bapt.name>

pkgname=igtf-trust-anchors
_pkgname=igtf-policy-installation-bundle
pkgver=1.116
pkgrel=1
pkgdesc="EUGridPMA IGTF Trust Anchor distribution"
arch=(any)
url="https://dist.igtf.net/"
source=(https://dist.eugridpma.info/distribution/igtf/$pkgver/$_pkgname-$pkgver.tar.gz{,.asc})
sha256sums=('bad2904b72ea7079eb9beb00c4880f053bd68962a25ecf3f4cd00575b7f751b7'
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
