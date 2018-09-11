# Maintainer: Chris Trotman <chris@trotman.io>

pkgname=stressdisk-bin
_srcname=stressdisk
pkgver=1.0.11
pkgrel=1
pkgdesc="Stress test your disks / memory cards / USB sticks before trusting your valuable data to them"
provides=('stressdisk')
conflicts=('stressdisk')
url="https://github.com/ncw/stressdisk"
license=('MIT')
depends=('glibc')
arch=('x86_64')
source=("https://github.com/ncw/stressdisk/releases/download/v$pkgver/stressdisk_${pkgver}_linux_amd64.zip"
"https://raw.githubusercontent.com/ncw/stressdisk/v$pkgver/COPYING")
sha512sums=('f9dbeb79d6aded003a37feebaf97e3fa7ebfed6a9d3579de3baea8dd2af058b14b8e7fef17280cdee070d002e19e70f94af96023bbc15a9ad1fd8c57c21a1953'
'a6e04ab1d0774fe80f31f93ef70c9e7f9fab3234f2c468f6a26d046fa9340c375779d7c777f675082bfa95ed5e617ab9df1cb756999b2e9508a0e68a99273158')

package() {
  cd $srcdir
  install -Dm755 stressdisk "$pkgdir/usr/bin/stressdisk"
  install -Dm644 $srcdir/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

