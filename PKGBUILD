# Maintainer: leaeasy <leaeasy at google dot com>
pkgname="plasma6-applets-fancytasks"
pkgver=1.1.5.r1105.gac7b879
pkgrel=1
pkgdesc="More modern taskbar-style window switcher displaying icons and text, with some improvments and color. Serves as a replacement for the Icon-Only and Task Manager plasmoids KDE ships with."
arch=(any)
url="https://github.com/alexankitty/FancyTasks"
license=(GPL)
depends=(plasma-workspace)
makedepends=(git)
provides=(fancytasks)
source=("git+https://github.com/leaeasy/FancyTasksPlus.git#branch=feature/enhancements")
sha512sums=('SKIP')

pkgver() {
  cd FancyTasksPlus
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  _pkgdir="$pkgdir/usr/share/plasma/plasmoids/alexankitty.fancytasks"
  _iconpkgdir="$pkgdir/usr/share/icons/hicolor/256x256/apps"
  mkdir -p "$_pkgdir"
  mkdir -p "$_iconpkgdir"
  cp FancyTasksPlus/package/FancyTasks.png "$_iconpkgdir"

  cp -r FancyTasksPlus/package/* "$_pkgdir"
  rm -rf "$_pkgdir/translate"
}
