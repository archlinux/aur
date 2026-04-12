# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
epoch=1
pkgname=pli-bin  
pkgver=1.4.1
pkgrel=1
pkgdesc="Iron Spring PL/I compiler - statically linked 386-binary"
url="http://www.iron-spring.com/"
arch=('i686' 'x86_64')
license=('custom' 'LGPL')
source=("http://www.iron-spring.com/pli-$pkgver.tgz")
sha512sums=('c573d395e6e05a384cee6b0d3f27ea1bd4763182a935eca9298f6e642bd542da1cc4d6b8e5112e0c9ef325c11218f416d9b27703ebd727d2bd4ac22eab47e3e0')
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
