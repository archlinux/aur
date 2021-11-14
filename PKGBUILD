# Maintainer: Steffen Hansen <steffengrundsoe@gmail.com>
_pkgname=quickgui
pkgname=$_pkgname-bin
pkgver=1.1.4
pkgrel=1
pkgdesc="A Flutter frontend for quickget and quickemu"
arch=('x86_64')
url="https://github.com/quickgui/quickgui"
license=('unknown')
depends=('quickemu')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.tar.xz"::"https://github.com/quickgui/quickgui/releases/download/v$pkgver/quickgui-$pkgver.tar.xz")
md5sums=('56a63078d5864f00732b64ae735f85a7')

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
