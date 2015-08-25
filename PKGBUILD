# Contributors: 
##Frank Phillips <frankalso[at]gmail[dot]com>
##mh00h

pkgname=iscan-plugin-gt-x820
pkgver=2.2.0
_realpkgver=2.2.0-1
pkgrel=1
pkgdesc="iscan plugin for Epson Colorio GT-X820/Perfection Photo V600 scanners."
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom')
depends=('iscan')
install=gt-x820.install

[ "$CARCH" = x86_64   ] && 
source=(http://a1227.g.akamai.net/f/1227/40484/1d/download.ebz.epson.net/dsc/f/01/00/02/09/22/3881ed4f9aff07f6e1f21842a41bc6ee5d7f3434/$pkgname-${_realpkgver}.x86_64.rpm)
[ "$CARCH" = i686   ] && 
source=(http://a1227.g.akamai.net/f/1227/40484/1d/download.ebz.epson.net/dsc/f/01/00/02/09/22/36d148fbd59e5b8c15ee002be442ea18701a2389/$pkgname-${_realpkgver}.i386.rpm)

[ "$CARCH" = x86_64   ] && md5sums=('d193219b329c8e3a4ee1d87afd6bd535')
[ "$CARCH" = i686   ] && md5sums=('b616fd1358da189fff06482d04b92e2e')

package() {
  cd "$srcdir"
  mv usr "$pkgdir"
  if [ "$CARCH" = "x86_64" ]
    then
      mv "$pkgdir"/usr/lib{64,}
  fi
  mkdir "$pkgdir"/usr/share/licenses
  mv "$pkgdir"/usr/share/doc/$pkgname-$pkgver "$pkgdir"/usr/share/licenses/
  rm -rf "$pkgdir"/usr/share/doc
}


