# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=mangojuice-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A convenient alternative for setting up Mangohud (binary release)"
url="https://github.com/radiolamp/mangojuice"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('libadwaita' 'libgee' 'mangohud')
makedepends=('fuse2')
provides=("mangojuice")
conflicts=("mangojuice")
_appimage=MangoJuice-$pkgver-x86_64.AppImage
source=("$url/releases/download/$pkgver/$_appimage")
sha256sums=('3b603eca0aff333c5606faad2913020397858bc4842089493e00992bb6b0ec73')

prepare() {
  chmod +x ./$_appimage
  ./$_appimage --appimage-extract
}

package() {
  cd AppDir
  install -Dm644 io.github.radiolamp.mangojuice.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 share/icons/hicolor/scalable/apps/io.github.radiolamp.*.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm755 shared/bin/mangojuice -t "$pkgdir/usr/bin"
}
