pkgname=envycontrol-tray
pkgver=1.0.0
pkgrel=3
pkgdesc="A GTK tray icon for EnvyControl to switch between graphics modes. Rocker fegyelem!"
arch=('any')
url="https://github.com/amolnaristvan/envycontrol-tray"
license=('GPL3')
depends=('envycontrol' 'python-gobject' 'gtk3' 'libappindicator-gtk3')
makedepends=('git')
source=("git+https://github.com/amolnaristvan/envycontrol-tray.git")
sha256sums=('SKIP')
package() {
  cd "$srcdir/$pkgname"

  # Könyvtárak létrehozása
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/pixmaps"

  # Fájlok telepítése a GitHub repóból
  install -m755 envycontrol-tray.py "$pkgdir/usr/bin/envycontrol-tray"
  install -m644 envycontrol-tray.desktop "$pkgdir/usr/share/applications/"
  install -m644 *.png "$pkgdir/usr/share/pixmaps/"
}
