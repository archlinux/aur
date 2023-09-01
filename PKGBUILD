# Maintainer: Alexandra Stone <ideas@alexankitty.com>
pkgname="fancytasks"
pkgver=1.1.4
pkgrel=1
pkgdesc="More modern taskbar-style window switcher displaying icons and text, with some improvments and color. Serves as a replacement for the Icon-Only and Task Manager plasmoids KDE ships with."
arch=(any)
url="https://github.com/alexankitty/FancyTasks"
license=(GPL)
depends=(plasma-workspace kirigami2)
makedepends=(git python3)
provides=(fancytasks)
source=("git+https://github.com/alexankitty/FancyTasks.git")
sha512sums=('SKIP')

pkgver() {
  cd FancyTasks
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  _pkgdir="$pkgdir/usr/share/plasma/plasmoids/alexankitty.fancytasks"
  _iconpkgdir="$pkgdir/usr/share/icons/hicolor/256x256/apps"
  mkdir -p "$_pkgdir"
  mkdir -p "$_iconpkgdir"
  cp FancyTasks/FancyTasks.png "$_iconpkgdir"

  cp -r FancyTasks/* "$_pkgdir"
  rm "$_pkgdir/README.MD"
  rm "$_pkgdir/install.sh"
  rm "$_pkgdir/FancyTasks.png"
  rm -rf "$_pkgdir/package/translate"
}
