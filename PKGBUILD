# Author: Mantas Mikulėnas <grawity@gmail.com>
# Maintainer: Baptiste Grenier <baptiste@bapt.name>

pkgname=igtf-trust-anchors
_pkgname=igtf-policy-installation-bundle
pkgver=1.110
pkgrel=2
pkgdesc="EUGridPMA IGTF Trust Anchor distribution"
arch=(any)
url="https://dist.igtf.net/"
source=(https://dist.eugridpma.info/distribution/igtf/$pkgver/$_pkgname-$pkgver.tar.gz{,.asc})
sha256sums=('83a9eacad16e9747b75c835b65fb9c3a2afe2ca59193afa983c56a40c4dfa036'
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
