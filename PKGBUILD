# Maintainer: Drommer <drommer.94@github.com>

_gitname=plasma6-separator-applet
pkgname=plasma6-applets-separator-git
pkgver=r22.3813976
pkgrel=1
pkgdesc="A KDE Plasma 6 applet that acts as a separator between applets"
arch=('any')
url="https://github.com/dhruv8sh/$_gitname"
license=('GPL-2.0')
depends=('plasma-workspace')
makedepends=('git')
source=("git+$url.git")
sha256sums=('SKIP')
replaces=('plasma5-applets-separator' 'plasma5-applets-latte-separator')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  _pkgdir="$pkgdir/usr/share/plasma/plasmoids/org.kde.separator"
  mkdir -p "$_pkgdir"
  cp -r $_gitname/* $_pkgdir
  rm $_pkgdir/{README,CHANGELOG}.md
}
