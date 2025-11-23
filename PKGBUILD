# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=nmrpflash
pkgname=$_pkgname
pkgver=0.9.26
pkgrel=1
pkgdesc="Netgear Unbrick Utility"
arch=('x86_64')
url="https://github.com/jclehner/nmrpflash"
license=('GPL-3.0-or-later')
depends=('libpcap' 'libnl>=3')
makedepends=('make')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/jclehner/nmrpflash/archive/v$pkgver.tar.gz")
sha256sums=('51cc37b85b04ff59dda1a5b83ba443d7f577677305aab653855d7c1f78c6d704')
b2sums=('b5d1084376b7f780bbe1dd993c473b613b2b2efa9bd20cd2b20c5122a3c1da669914a28471bf7b4a0d2179fa004592177a796f11878b3f90207ca875507a7817')

build() {
  cd "$_pkgname-$pkgver"

  make
}

package() {
  cd "$_pkgname-$pkgver"

  install -dm0755 "$pkgdir"/usr/bin
  make install PREFIX="$pkgdir/usr"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
