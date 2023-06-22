# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
epoch=1
pkgname=pli-bin  
pkgver=1.1.0
pkgrel=1
pkgdesc="Iron Spring PL/I compiler - statically linked 386-binary"
url="http://www.iron-spring.com/"
arch=('i686' 'x86_64')
license=('custom' 'LGPL')
source=("http://www.iron-spring.com/pli-$pkgver.tgz")
sha512sums=('7aea80dec99caa569161ec45bffbcabb140cc955044f980c70c0f128cd890e6de4f08209be74d831a05b906c0814d9abde12a798606515beecacced259514b09')
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
