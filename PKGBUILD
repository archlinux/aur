# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=zita-ajbridge-gui
pkgver=1.2
pkgrel=2
pkgdesc="A simple GUI frontend for zita-ajbridge"
arch=('i686' 'x86_64')
url="https://github.com/leledumbo/zita-ajbridge-gui"
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
    source+=("zitaajbridgegui::https://github.com/leledumbo/zita-ajbridge-gui/releases/download/v1.0/zitaajbridgegui-i386-qt")
    md5sums+=('09ddecdc7f3ea5288d1b133972c343ab')
  fi

  if [ "$CARCH" == "x86_64" ]
  then
    source+=("zitaajbridgegui::https://github.com/leledumbo/zita-ajbridge-gui/releases/download/v1.0/zitaajbridgegui-x86_64-qt")
    md5sums+=('be92d7c986a96b183979b2e6e4432d8a')
  fi
else
  depends+=('gtk2')

  if [ "$CARCH" == "i686" ]
  then
    source+=("zitaajbridgegui::https://github.com/leledumbo/zita-ajbridge-gui/releases/download/v1.0/zitaajbridgegui-i386-gtk2")
    md5sums+=('43d9f054f3eaec14be542ca1f8236e16')
  fi

  if [ "$CARCH" == "x86_64" ]
  then
    source+=("zitaajbridgegui::https://github.com/leledumbo/zita-ajbridge-gui/releases/download/v1.0/zitaajbridgegui-x86_64-gtk2")
    md5sums+=('7d9aa684878ba42991bb6f1e336ba8f1')
  fi
fi

package() {
  install -Dm755 $srcdir/zitaajbridgegui $pkgdir/usr/bin/zitaajbridgegui
  install -Dm644 $srcdir/zitaajbridgegui.desktop $pkgdir/usr/share/applications/zitaajbridgegui.desktop
  install -Dm644 $srcdir/zitaajbridgegui.png $pkgdir/usr/share/icons/hicolor/128x128/apps/zitaajbridgegui.png
}
