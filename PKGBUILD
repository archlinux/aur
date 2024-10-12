# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=nmrpflash
pkgname=$_pkgname
pkgver=0.9.24
pkgrel=1
pkgdesc="Netgear Unbrick Utility"
arch=('x86_64')
url="https://github.com/jclehner/nmrpflash"
depends=('libpcap' 'libnl>=3')
makedepends=('make')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/jclehner/nmrpflash/archive/v$pkgver.tar.gz")
cksums=('2894910828')
sha256sums=('e902b8098a41c4c949fccd661dedcc8ca3791c83919a2b233286eae4752f25ea')
b2sums=('42c46ac035bf21c15d5dee072ee429fc672b6e2c10e88aeb5c15069895583391f75c3ca0c35413751c750a4051e2f55c8a415baeb84f1e3378c3dbd4ebad30c9')

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
