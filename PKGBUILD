# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
epoch=1
pkgname=pli-bin  
pkgver=0.9.9a
pkgrel=1
pkgdesc="Iron Spring PL/I compiler - statically linked 386-binary"
url="http://www.iron-spring.com/"
arch=('i686' 'x86_64')
license=('LGPL')
source=(http://www.iron-spring.com/pli-$pkgver.tgz)
md5sums=('eb87d7a1a7f3cd34df22ff358cab9f8e')
options=(staticlibs)

package() {
  cd $srcdir/pli-${pkgver}
  install -Dm755 plic $pkgdir/usr/bin/plic-${pkgver}
  ln -fs $pkgdir/usr/bin/plic-${pkgver} $pkgdir/usr/bin/plic
  install -Dm644 lib/libprf.a $pkgdir/usr/lib/libprf-${pkgver}
  ln -fs $pkgdir/usr/lib/libprf-${pkgver} $pkgdir/usr/lib/libprf.a
  install -d $pkgdir/usr/share/doc/pli
  for _i in islogo.gif *.html prog_guide.html samples
  do
    cp -r ${_i} $pkgdir/usr/share/doc/pli
  done
}
