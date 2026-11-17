# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=nmrpflash
pkgname=$_pkgname
pkgver=0.9.28
pkgrel=1
pkgdesc="Netgear Unbrick Utility"
arch=('x86_64')
url="https://github.com/jclehner/nmrpflash"
license=('GPL-3.0-or-later')
depends=('libpcap' 'libnl>=3')
makedepends=('make')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/jclehner/nmrpflash/archive/v$pkgver.tar.gz")
sha256sums=('8d3ec766b7f43bd060032db3cec40c500ef1edc562281f239e308595b66a4176')
b2sums=('230656cf853199f834b2fcf32ebc5d79df1b8145c2fa0f06085e9b99876153fb576164864dd2f3d09c3db18cbf34ee6216be27b7023726108cb6e030276ff69d')

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
