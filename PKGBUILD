# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=mangojuice-bin
pkgver=0.8.9
pkgrel=1
pkgdesc="A convenient alternative for setting up Mangohud (binary release)"
url="https://github.com/radiolamp/mangojuice"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('libadwaita' 'libgee' 'mangohud')
makedepends=('fuse2')
provides=("mangojuice")
conflicts=("mangojuice")
source=("MangoJuice-$pkgver.zip::$url/releases/download/$pkgver/MangoJuice-AppImagename-x86_64.zip")
sha256sums=('bf68d8fc2577edfe84138f18b7f9a6fe7fcc6b514fa1214d134729e14104ddcd')

prepare() {
  chmod +x ./MangoJuice-*-x86_64.AppImage
  ./MangoJuice-*-x86_64.AppImage --appimage-extract
}

package() {
  cd AppDir
  install -Dm644 io.github.radiolamp.mangojuice.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 share/icons/hicolor/scalable/apps/io.github.radiolamp.*.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm755 shared/bin/mangojuice -t "$pkgdir/usr/bin"
}
