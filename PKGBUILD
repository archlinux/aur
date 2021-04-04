# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
epoch=1
pkgname=pli-bin  
pkgver=0.9.10d
pkgrel=1
pkgdesc="Iron Spring PL/I compiler - statically linked 386-binary"
url="http://www.iron-spring.com/"
arch=('i686' 'x86_64')
license=('custom' 'LGPL')
source=("http://www.iron-spring.com/pli-$pkgver.tgz")
sha512sums=('10dce299622a0d5138cfb51e54aac913260926e230241ed6d1c87d98916367f5fc3f21e040a3e1fa3747a63926198355d5e5e9baa362ed5d720b4bf39c32c3d8')
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
