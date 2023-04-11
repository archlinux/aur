# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=flemozi
pkgname=$_pkgname-bin
pkgdesc="An advanced Emoji Picker written with Flutter (binary release)"
pkgver=0.1.0
pkgrel=1
arch=('x86_64')
url="https://github.com/KRTirtho/flemozi"
license=('GPL3')
depends=('xdg-user-dirs' 'libkeybinder3')
conflicts=($_pkgname)
provides=($_pkgname)
_commit=244351a11b6f57142882ada6c7e0260f9eca7e9c
_url2=https://raw.githubusercontent.com/KRTirtho/flemozi/$_commit
source=("$url/releases/download/v$pkgver/Flemozi-linux-x86_64.rpm"
        "$_url2/LICENSE"
        "$_url2/README.md")
sha256sums=('1fb2532cf7c0ff3316fbcfb78c437dbfa302bbeaa282e6d14b446bec60c7d508'
            'SKIP'
            'SKIP')

package() {
  # Create folders
  mkdir -p $pkgdir/opt
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/pixmaps
  # Install
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/flemozi"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/flemozi"
  install -Dm644 usr/share/applications/flemozi.desktop -t "$pkgdir/usr/share/applications"
  cp -r usr/share/flemozi "$pkgdir/opt/Flemozi"
  ln -s /opt/Flemozi/flemozi -t "$pkgdir/usr/bin"
  ln -s /opt/Flemozi/data/flutter_assets/assets/logo.png "$pkgdir/usr/share/pixmaps/flemozi.png"
}
