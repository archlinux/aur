# Maintainer: Derek Brown <derekbro@andrew.cmu.edu>
pkgname=c0
pkgver=0.590
pkgrel=1
pkgdesc="C0 Package for 15-122"
url="http://c0.typesafety.net/index.html"
arch=('x86_64' 'i686')
license=('GPL')
depends=('libpng12>=1.2' 'zlib>=1.2' 'make>=4.0' 'gcc>=5.1' 'ncurses5-compat-libs>=6.0')
provides=('coin' 'cc0')
source=("$pkgname::http://c0.typesafety.net/dist/cc0-v0590-linux4.4.0-bin.tgz")
md5sums=('62e51ffbb7f6b03c7e863757c9705922')

package() {

  # Create Installation Folder Structure
  mkdir -p $pkgdir/usr/lib/c0
  cp -r $srcdir/cc0/* $pkgdir/usr/lib/c0

  mkdir -p $pkgdir/usr/bin

  # Install C0 Bin
  chmod +x $pkgdir/usr/lib/c0/bin/cc0.bin
  echo -e '#!/bin/sh\n/usr/lib/c0/bin/cc0.bin $@' >> $pkgdir/usr/bin/cc0
  chmod +x $pkgdir/usr/bin/cc0

  # Install Coin Bin
  chmod +x $pkgdir/usr/lib/c0/bin/coin.bin
  echo -e '#!/bin/sh\n/usr/lib/c0/bin/coin.bin $@' >> $pkgdir/usr/bin/coin
  chmod +x $pkgdir/usr/bin/coin
}
