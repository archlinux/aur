# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
epoch=1
pkgname=pli-bin  
pkgver=0.9.9b
pkgrel=1
pkgdesc="Iron Spring PL/I compiler - statically linked 386-binary"
url="http://www.iron-spring.com/"
arch=('i686' 'x86_64')
license=('LGPL')
source=(http://www.iron-spring.com/pli-$pkgver.tgz)
sha512sums=('6cf06475e87977a47ff51b3cc6c51fc5f3958f729db0d2d18853b238ef86b2e1c858eec3ee262a108b2cbf485eb648dba73648360ac158b705ee8b564d407b17')
options=(staticlibs)

package() {
  cd $srcdir/pli-${pkgver}
  install -Dm755 plic $pkgdir/usr/bin/plic
  install -Dm644 lib/libprf.a $pkgdir/usr/lib/libprf
  install -d $pkgdir/usr/share/doc/pli
  for _i in islogo.gif *.html prog_guide.html samples
  do
    cp -r ${_i} $pkgdir/usr/share/doc/pli
  done
}
