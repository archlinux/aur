# Maintainer: Steffen Hansen <steffengrundsoe@gmail.com>
_pkgname=quickgui
pkgname=$_pkgname-bin
pkgver=1.2.4
pkgrel=1
pkgdesc="A Flutter frontend for quickget and quickemu"
arch=('x86_64')
url="https://github.com/quickgui/quickgui"
license=('unknown')
depends=('quickemu' 'zenity')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.tar.xz"::"https://github.com/quickgui/quickgui/releases/download/v$pkgver/quickgui-$pkgver.tar.xz")
sha256sums=('1b823c871a5115965cf5720f14922eb587cc1885bd3af46926e8de157b59bb26')

package() {
  cd "$_pkgname-$pkgver"

  install -Dm755 quickgui "$pkgdir/opt/$_pkgname/quickgui"
  install -Dm644 resources/quickgui.desktop "${pkgdir}/usr/share/applications/quickgui.desktop"
  install -Dm644 resources/quickgui_512.png "${pkgdir}/usr/share/icons/quickgui_512.png"

  cp -R data "$pkgdir/opt/$_pkgname"
  cp -R lib "$pkgdir/opt/$_pkgname"

  install -d "$pkgdir/usr/bin/"
  ln -s /opt/$_pkgname/quickgui "$pkgdir/usr/bin/quickgui"
}
