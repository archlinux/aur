# Maintainer: Derek Brown <derekbro@andrew.cmu.edu>
pkgname=c0
pkgver=0.44
pkgrel=1
pkgdesc="C0 Package for 15-122"
url="http://c0.typesafety.net/index.html"
arch=('x86_64' 'i686')
license=('GPL')
depends=('libpng>=1.6','zlib>=1.2')
provides=('coin','cc0')
source=("$pkgname::http://c0.typesafety.net/dist/cc0-v0440-linux3.18.1-64bit-bin.tgz")
md5sums=('1b7bb88eda5f196326ad2df5cb2553b3')

package() {
  mkdir -p $pkgdir/usr/lib/c0
  cp -r $srcdir/cc0/* $pkgdir/usr/lib/c0

  mkdir -p $pkgdir/usr/bin
  chmod +x $pkgdir/usr/lib/c0/bin/cc0.bin
  ln -s $pkgdir/usr/lib/c0/bin/cc0.bin $pkgdir/usr/bin/cc0
  chmod +x $pkgdir/usr/lib/c0/bin/coin.bin
  ln -s $pkgdir/usr/lib/c0/bin/coin.bin $pkgdir/usr/bin/coin

}
