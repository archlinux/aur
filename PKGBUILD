# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
epoch=1
pkgname=pli-bin  
pkgver=0.9.10c
pkgrel=1
pkgdesc="Iron Spring PL/I compiler - statically linked 386-binary"
url="http://www.iron-spring.com/"
arch=('i686' 'x86_64')
license=('custom' 'LGPL')
source=("http://www.iron-spring.com/pli-$pkgver.tgz")
sha512sums=('b83672c95c7b2fb510285b6d066742dba09fe7b09bbfae414498fb41997c0a4c892c4dcc98b9200ae0372dc1cff63a7487d65edaf14eaeed116f22ec636d02e9')
options=('staticlibs')

package() {
  cd pli-${pkgver}
  install -Dm755 plic "$pkgdir"/usr/bin/plic
  install -Dm644 lib/libprf.a "$pkgdir"/usr/lib/libprf
  install -d "$pkgdir"/usr/share/doc/pli
  for _i in islogo.gif *.html samples *.pdf
  do
    cp -r ${_i} "$pkgdir"/usr/share/doc/pli
  done
  install -Dm644 readme_linux.html \
	  "$pkgdir"/usr/share/licenses/$pkgname/readme_linux.html
}
