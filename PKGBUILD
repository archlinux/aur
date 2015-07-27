# Contributors: Eduard "bekks" Warkentin <eduard.warkentin@gmx.de>
#               Milan HrabÃ¡nek <hrabi@linuxwaves.com>
pkgname=poker-engine
pkgver=1.3.6
pkgrel=1
pkgdesc="poker-engine is a python library that implements poker rules according to variants and betting structures specified in configuration"
arch=('i686')
url="https://gna.org/projects/pokersource/"
license="GPL"
depends=(pypoker-eval)
source=(http://download.gna.org/pokersource/sources/$pkgname-$pkgver.tar.gz)
md5sums=('a0de508fb3027bb96c9f00927267d879')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install
  chmod 0644 $startdir/pkg/etc/poker-engine/
  rm -rf $startdir/pkg/usr/share/poker-engine/upgrades/
}
