# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=flemozi
pkgname=$_pkgname-bin
pkgdesc="An advanced Emoji Picker written with Flutter (binary release)"
pkgver=0.1.1
pkgrel=5
arch=('x86_64')
url="https://github.com/KRTirtho/flemozi"
license=('GPL3')
depends=('xdg-user-dirs' 'libkeybinder3')
conflicts=($_pkgname)
provides=($_pkgname)
source=("$_pkgname-$pkgver-linux-x86_64.rpm::$url/releases/download/v$pkgver/Flemozi-linux-x86_64.rpm")
sha256sums=('585e061b7519c3470fe9ba34acd2276125d7e098b88fedc602f738ba8e9c6a5f')

package() {
  # Create folders
  mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin"
  # Install
  mv usr/share/$_pkgname "$pkgdir/opt"
  ln -s /opt/$_pkgname/$_pkgname -t "$pkgdir/usr/bin"
  install -Dm644 usr/share/applications/$_pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 usr/share/pixmaps/$_pkgname.png -t "$pkgdir/usr/share/pixmaps"
  install -Dm644 $pkgdir/opt/$_pkgname/data/flutter_assets/assets/logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
}
