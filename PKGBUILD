# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=nmrpflash
pkgname=$_pkgname
pkgver=0.9.25
pkgrel=1
pkgdesc="Netgear Unbrick Utility"
arch=('x86_64')
url="https://github.com/jclehner/nmrpflash"
depends=('libpcap' 'libnl>=3')
makedepends=('make')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/jclehner/nmrpflash/archive/v$pkgver.tar.gz")
cksums=('2510137390')
sha256sums=('729b2890620febda4748b502f652f17b9343c9bdd80c1608656c2767e86f6b04')
b2sums=('2366004fc67b4c9a4e4064b2a2edaecba6965b5e0367ed4190c40846adad2b5ee5f6d2e9dca7ea2a562098f566437a6096ff23b469c5ef94277540627cb6420f')

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
