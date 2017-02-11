# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=zita-ajbridge-gui
pkgver=1.2
pkgrel=1
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
    md5sums+=('09ddecdc7f3ea5288d1b133972c343ab')
  fi

  if [ "$CARCH" == "x86_64" ]
  then
    source+=("zitaajbridgegui::https://bitbucket.org/leledumbo/zita-aj-bridge-gui/downloads/zitaajbridgegui-x86_64-qt")
    md5sums+=('ada9bff08e30b0b5259898d29e929b6c')
  fi
else
  depends+=('gtk2')

  if [ "$CARCH" == "i686" ]
  then
    source+=("zitaajbridgegui::https://bitbucket.org/leledumbo/zita-aj-bridge-gui/downloads/zitaajbridgegui-i386-gtk2")
    md5sums+=('3dd6857b95e672666943311ac3ca8be6')
  fi

  if [ "$CARCH" == "x86_64" ]
  then
    source+=("zitaajbridgegui::https://bitbucket.org/leledumbo/zita-aj-bridge-gui/downloads/zitaajbridgegui-x86_64-gtk2")
    md5sums+=('91c362085d9cc92ccd2b475ef4e0c053')
  fi
fi

package() {
  install -Dm755 $srcdir/zitaajbridgegui $pkgdir/usr/bin/zitaajbridgegui
  install -Dm644 $srcdir/zitaajbridgegui.desktop $pkgdir/usr/share/applications/zitaajbridgegui.desktop
  install -Dm644 $srcdir/zitaajbridgegui.png $pkgdir/usr/share/icons/hicolor/128x128/apps/zitaajbridgegui.png
}
