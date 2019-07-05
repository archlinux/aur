# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
epoch=1
pkgname=pli-bin  
pkgver=0.9.10b
pkgrel=1
pkgdesc="Iron Spring PL/I compiler - statically linked 386-binary"
url="http://www.iron-spring.com/"
arch=('i686' 'x86_64')
license=('custom' 'LGPL')
source=("http://www.iron-spring.com/pli-$pkgver.tgz")
sha512sums=('fd6ea2720e474b195a69ce1526b017af6322d07b5aa81fff2ce7be1bb282f34b6dcad357931657af78176d2cf4bbc8ffb3782b5bc4ce2ff2e0214a6b934d3652')
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
