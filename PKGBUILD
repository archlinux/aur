# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=zita-ajbridge-gui
pkgver=1.0
pkgrel=1
pkgdesc="A simple GUI frontend for zita-ajbridge"
arch=('i686' 'x86_64')
url="https://bitbucket.org/leledumbo/zita-aj-bridge-gui"
license=('GPL')
depends=()
source=('zitaajbridgegui.png' 'zitaajbridgegui.desktop')
md5sums=('3c5fbbb345957fa0748e1fdd9a82a0a8' 'c118638bd836b4cbf055fe615ad6ffbd')
install=$pkgname.install

# uncomment for qt version, the default is gtk2
# _widgetset=qt

if [ "$_widgetset" == "qt" ]
then
  depends+=('qt4' 'qt4pas')

  if [ "$CARCH" == "i686" ]
  then
    source=("zitaajbridgegui::https://bitbucket.org/leledumbo/zita-aj-bridge-gui/downloads/zitaajbridgegui-i386-qt")
    md5sums=('a94b2d0f2513c2c0ae3b0c9821360ab7')
  fi

  if [ "$CARCH" == "x86_64" ]
  then
    source=("zitaajbridgegui::https://bitbucket.org/leledumbo/zita-aj-bridge-gui/downloads/zitaajbridgegui-x86_64-qt")
    md5sums=('60bba2a4556bb047a5951818dabb8482')
  fi
else
  depends+=('gtk2')

  if [ "$CARCH" == "i686" ]
  then
    source=("zitaajbridgegui::https://bitbucket.org/leledumbo/zita-aj-bridge-gui/downloads/zitaajbridgegui-i386-gtk2")
    md5sums=('09621b9e485e0738fce246b3dc159a2c')
  fi

  if [ "$CARCH" == "x86_64" ]
  then
    source=("zitaajbridgegui::https://bitbucket.org/leledumbo/zita-aj-bridge-gui/downloads/zitaajbridgegui-x86_64-gtk2")
    md5sums=('400ee74794d6428e3fff8445c536f3cb')
  fi
fi

package() {
  install -Dm755 $srcdir/zitaajbridgegui $pkgdir/usr/bin/zitaajbridgegui
  install -Dm644 $srcdir/zitaajbridgegui.desktop $pkgdir/usr/share/applications/zitaajbridgegui.desktop
  install -Dm644 $srcdir/zitaajbridgegui.png $pkgdir/usr/share/icons/hicolor/128x128/apps/zitaajbridgegui.png  
}
