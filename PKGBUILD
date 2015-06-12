# Maintainer: Jose Riha <jose1711 gmail com> 

pkgname=gimp-fix-ca
pkgver=3.0.2
pkgrel=3
pkgdesc="A Gimp plugin for correcting chromatic aberration (CA)"
url="http://kcd.sourceforge.net/fix-ca.php"
arch=('i686' 'x86_64')
license=("GPL")
depends=('gimp')
makedepends=('pkgconfig')
source=(http://kcd.sourceforge.net/fix-ca.c)
md5sums=('8cf2fb2e731ac0785dda0064bce11e24')

build() {
  cd $srcdir
  LIBS=-lm gimptool-2.0 --build fix-ca.c
}

package() {
  install -Dm 755 ./fix-ca $pkgdir/usr/lib/gimp/2.0/plug-ins/fix-ca
}
