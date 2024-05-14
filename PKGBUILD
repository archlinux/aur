# Maintainer: Sterophonick
pkgname=ez4-client
_pkgname='ez4-client'
pkgver=20140306
pkgrel=1
pkgdesc='SuperCard SD Patching Software'
arch=(x86_64 i686)
depends=('wine' 'winetricks')
source=(https://www.ezflash.cn/zip/EZ4_20140306.zip
        ez4-client
        ez4-client.desktop
        ez4-client.png)
md5sums=('da68eb7e6562a769f1fba23cb00cb54d'
         'SKIP'
         'SKIP'
         'SKIP')
options=(!debug !strip)

package() {
  install -Dm755 ez4-client $pkgdir/usr/bin/ez4-client
  install -Dm644 ez4-client.desktop $pkgdir/usr/share/applications/ez4-client.desktop
  install -Dm644 ez4-client.png $pkgdir/usr/share/pixmaps/ez4-client.png

  mkdir -p $pkgdir/usr/share/ez4-client

  cp -r $srcdir/Language $pkgdir/usr/share/ez4-client
  cp -r $srcdir/skin $pkgdir/usr/share/ez4-client
  cp -r $srcdir/*.docx $pkgdir/usr/share/ez4-client
  cp -r $srcdir/*.exe $pkgdir/usr/share/ez4-client
  cp -r $srcdir/*.dll $pkgdir/usr/share/ez4-client
  cp -r $srcdir/ezfla_up.bin $pkgdir/usr/share/ez4-client
  chmod -R 777 $pkgdir/usr/share/ez4-client
}
