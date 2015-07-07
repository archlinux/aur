# Zork I adventure game

# Contributor: David Rosenstrauch <darose@darose.net>

pkgname=zork1
pkgver=1
pkgrel=10
pkgdesc="Zork I adventure game (for Infocom's z-code interpreter)"
url="http://infocom.elsewhere.org/scheyen/"
depends=(jzip)
source=(${url}Download/$pkgname.zip
        ${url}Maps/zork1/legend.gif
        ${url}Maps/zork1/zork1a.gif
        ${url}Maps/zork1/zork1b.gif
        ${url}Maps/zork1/zork1c.gif
        ${url}Maps/zork1/zork1d.gif
        LICENSE)
md5sums=('f6dd915ea7315985536efb39154f3433'
         '77a5784cdadf0a4d882da79a2975e5a7'
         '894e88de2c5397aac3c7b2dd829d9bf6'
         'f9cf3234a02fb723b32bd19163995879'
         '6c9097056a8253b401387822c53da050'
         '4a51828e038afd6e05bb1bafa57438a1'
         '961576a5d7de0363d40ccdb3f08512b3')
arch=('any')
license="custom"

package() {
  cd $srcdir

  install -D -m644 DATA/ZORK1.DAT $pkgdir/usr/share/zork/$pkgname/ZORK1.DAT
  install -D -m644 legend.gif $pkgdir/usr/share/zork/$pkgname/maps/legend.gif
  install -m644 *.gif $pkgdir/usr/share/zork/$pkgname/maps/
  echo "#!/bin/sh" > $pkgname
  echo jzip -m /usr/share/zork/$pkgname/ZORK1.DAT >> $pkgname
  install -D -m755 $pkgname $pkgdir/usr/bin/$pkgname
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
