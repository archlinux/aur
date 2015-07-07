# Zork II adventure game

# Contributor: David Rosenstrauch <darose@darose.net>

pkgname=zork2
pkgver=1
pkgrel=10
pkgdesc="Zork II adventure game (for Infocom's z-code interpreter)"
url="http://infocom.elsewhere.org/scheyen/"
depends=(jzip)
source=(${url}Download/$pkgname.zip
        ${url}Maps/zork2/legend.gif
        ${url}Maps/zork2/zork2a.gif
        ${url}Maps/zork2/zork2b.gif
        LICENSE)
md5sums=('ab521209656948516351996263a8ad34'
         'e7120906257c72be9ff5827ac188a35a'
         '5da56d090d53f1bd1a495849745eeae1'
         '89a7c478b12b2bd0b16b6534c18bf181'
         'e1d314b3b784734c1a365a04ffff96c4')
arch=('any')
license="custom"

package() {
  cd $srcdir

  install -D -m644 DATA/ZORK2.DAT $pkgdir/usr/share/zork/$pkgname/ZORK2.DAT
  install -D -m644 legend.gif $pkgdir/usr/share/zork/$pkgname/maps/legend.gif
  install -m644 *.gif $pkgdir/usr/share/zork/$pkgname/maps/
  echo "#!/bin/sh" > $pkgname
  echo jzip -m /usr/share/zork/$pkgname/ZORK2.DAT >> $pkgname
  install -D -m755 $pkgname $pkgdir/usr/bin/$pkgname
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
