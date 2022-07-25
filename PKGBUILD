# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=tth  
pkgver=4.16
pkgrel=1
pkgdesc="TeX to HTML translator"
url="http://hutchinson.belmont.ma.us/tth/"
arch=('i686' 'x86_64')
depends=('sh')
license=('custom')
source=($pkgname-${pkgver}_C.tar.gz::http://hutchinson.belmont.ma.us/tth/tth-noncom/tth_C.tgz)
sha256sums=('ff8b88c6dbb938f01fe6a224c396fc302ae5d89b9b6d97f207f7ae0c4e7f0a32')

build() {
  cd tth_C
  gcc -o tth tth.c 
}
package() {
  cd tth_C
  install -D -m755 tth "$pkgdir"/usr/bin/tth
  install -D -m755 ps2gif "$pkgdir"/usr/bin/ps2gif 
  install -D -m755 ps2png "$pkgdir"/usr/bin/ps2png 
  install -D -m755 latex2gif "$pkgdir"/usr/bin/latex2gif 
  install -D -m644 tth.1 "$pkgdir"/usr/share/man/man1/tth.1   
  install -D -m644 tth.gif "$pkgdir"/usr/share/icons/tth.gif 
  install -D -m644 tth_manual.html \
    "$pkgdir"/usr/share/doc/tth/tth_manual.html 
  install -D -m644 license.txt \
    "$pkgdir"/usr/share/licenses/tth/licenses.txt 
}
