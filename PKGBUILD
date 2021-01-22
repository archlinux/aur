# Maintainer: Amal Karunarathna <nasashinega@gmail.com>

_gitname=applet-window-title
pkgname=plasma5-applets-window-title-git
pkgver=0.2.r1.g58c4fc9
pkgrel=1
pkgdesc="Plasma 5 applet that shows the application title and icon for active window"
arch=(x86_64)
url="https://github.com/psifidotos/${_gitname}"
license=(GPL)
depends=(plasma-workspace)
makedepends=(git)
conflicts=(plasma5-applets-window-title)
provides=(plasma5-applets-window-title)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_gitname}
  git describe --long | sed 's/^[v-]//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  _pkgdir="$pkgdir/usr/share/plasma/plasmoids/org.kde.windowtitle"
  mkdir -p "$_pkgdir"
  cp -r applet-window-title/* "$_pkgdir"
  rm "$_pkgdir/README.md"
}