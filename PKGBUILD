# Zork I adventure game

# Contributor: David Rosenstrauch <darose@darose.net>

pkgname=zork1
pkgver=1
pkgrel=12
pkgdesc="Zork I adventure game (for Infocom's z-code interpreter)"
base_src_url="http://infocom.elsewhere.org"
depends=('frotz-ncurses')
source=(${base_src_url}/scheyen/Download/$pkgname.zip
        ${base_src_url}/gallery/zork1_invisiclues/map-1.jpg
        ${base_src_url}/gallery/zork1_invisiclues/map-2-3.jpg
        ${base_src_url}/gallery/zork1_invisiclues/map-4-5-6-7.jpg
        ${base_src_url}/gallery/zork1_invisiclues/map-8.jpg
        zork1
        LICENSE)
md5sums=('f6dd915ea7315985536efb39154f3433'
         '0b78716a9331857c679a764407fd253f'
         '391929102cc299346538104ba0f09f66'
         '7fcbb592f117e494035c50685dfb5a34'
         '22d243e4bd09cbf12a3220a40b33acd4'
         '1f2f4a7c9473c70e8fbe60293dbf75c1'
         '961576a5d7de0363d40ccdb3f08512b3')
arch=('any')
license=('custom')

package() {
  cd $srcdir

  install -D -m644 DATA/ZORK1.DAT $pkgdir/usr/share/zork/$pkgname/ZORK1.DAT
  install -d -m755 $pkgdir/usr/share/zork/$pkgname/maps/
  install -D -m644 *.jpg $pkgdir/usr/share/zork/$pkgname/maps/
  install -D -m755 $pkgname $pkgdir/usr/bin/$pkgname
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
