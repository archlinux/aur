# Maintainer: Mantas Mikulėnas <grawity@gmail.com>

pkgname=igtf-trust-anchors
_pkgname=igtf-policy-installation-bundle
pkgver=1.76
pkgrel=1
pkgdesc="EUGridPMA IGTF Trust Anchor distribution"
arch=(any)
url="https://dist.igtf.net/"
source=(https://dist.eugridpma.info/distribution/current/$_pkgname-$pkgver.tar.gz{,.asc})
sha256sums=('061b13b96175384cb5284c883bbdbc1aae60fa0562eeeb238d0e42cc3b8767e5'
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
