# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=nmrpflash
pkgname=$_pkgname
pkgver=0.9.22
pkgrel=1
pkgdesc="Netgear Unbrick Utility"
arch=('x86_64')
url="https://github.com/jclehner/nmrpflash"
depends=('libpcap' 'libnl>=3')
makedepends=('make')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/jclehner/nmrpflash/archive/v$pkgver.tar.gz")
cksums=('2954636508')
sha256sums=('cef3b54c798a4a049a2d9b959e1d6a0ac2f4f31b802d6be4f79351b9a96c3f39')
b2sums=('c96e07b8c667cb3b596c54239f9f4bb583f8c47bc87129dca20f691a1f4ab0c1efaaa7e46806f7f9538815fbd4ee368645851b6c0f28b6ea9c5c763c2564da40')

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
