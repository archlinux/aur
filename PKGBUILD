# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=zita-ajbridge-gui
pkgver=1.0
pkgrel=2
pkgdesc="A simple GUI frontend for zita-ajbridge"
arch=('i686' 'x86_64')
url="https://bitbucket.org/leledumbo/zita-aj-bridge-gui"
license=('GPL')
depends=()
source=('zitaajbridgegui.png' 'zitaajbridgegui.desktop')
md5sums=('3c5fbbb345957fa0748e1fdd9a82a0a8' '79c54171293d4854cb76667c0a2d48bb')
install=$pkgname.install

# uncomment for qt version, the default is gtk2
# _widgetset=qt

if [ "$_widgetset" == "qt" ]
then
  depends+=('qt4' 'qt4pas')

  if [ "$CARCH" == "i686" ]
  then
    source+=("zitaajbridgegui::https://bitbucket.org/leledumbo/zita-aj-bridge-gui/downloads/zitaajbridgegui-i386-qt")
    md5sums+=('d548e37bee5ee741fb6b29a9e9725ffb')
  fi

  if [ "$CARCH" == "x86_64" ]
  then
    source+=("zitaajbridgegui::https://bitbucket.org/leledumbo/zita-aj-bridge-gui/downloads/zitaajbridgegui-x86_64-qt")
    md5sums+=('0d8663cdc307ac931aa88d38b503e7d2')
  fi
else
  depends+=('gtk2')

  if [ "$CARCH" == "i686" ]
  then
    source+=("zitaajbridgegui::https://bitbucket.org/leledumbo/zita-aj-bridge-gui/downloads/zitaajbridgegui-i386-gtk2")
    md5sums+=('b631af4aa255b52d79ef6adadb1b321e')
  fi

  if [ "$CARCH" == "x86_64" ]
  then
    source+=("zitaajbridgegui::https://bitbucket.org/leledumbo/zita-aj-bridge-gui/downloads/zitaajbridgegui-x86_64-gtk2")
    md5sums+=('6245f77bfdaf25d8b84940443d6f32ea')
  fi
fi

package() {
  install -Dm755 $srcdir/zitaajbridgegui $pkgdir/usr/bin/zitaajbridgegui
  install -Dm644 $srcdir/zitaajbridgegui.desktop $pkgdir/usr/share/applications/zitaajbridgegui.desktop
  install -Dm644 $srcdir/zitaajbridgegui.png $pkgdir/usr/share/icons/hicolor/128x128/apps/zitaajbridgegui.png
}
