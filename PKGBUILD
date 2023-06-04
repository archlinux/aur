# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=upscayl
pkgname=$_pkgname-bin-rpm
pkgver=2.5.5
pkgrel=1
pkgdesc="Free and Open Source AI Image Upscaler (binary release)"
url="https://github.com/upscayl/upscayl"
license=('AGPL3')
arch=('x86_64')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux.rpm")
sha256sums=('c5f5bf396c1d4631b894d9e4d076ff3bbeef61ab4fbfcfd770eea831d81c1975')

package() {
  mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin"
  cp -r opt/Upscayl "$pkgdir/opt/Upscayl"
  ln -s /opt/Upscayl/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 usr/share/icons/hicolor/0x0/apps/$_pkgname.png -t "$pkgdir/usr/share/icons/hicolor/512x512/apps"
  install -Dm644 usr/share/applications/$_pkgname.desktop -t "$pkgdir/usr/share/applications"
}
