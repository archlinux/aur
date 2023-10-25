# Maintainer: D3vil0p3r <vozaanthony[at]gmail[dot]com>

pkgname=plasma5-applets-corner-menu
pkgver=5.94d91bd
pkgrel=1
pkgdesc="KppleMenu-inspired MacOS and GNOME Style options menu."
arch=(any)
url="https://www.opencode.net/arshbangar/corner-menu"
license=(LGPL2)
depends=('plasma-workspace')
makedepends=('git')
source=("$pkgname::git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd $pkgname

  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd $pkgname

  _pkgdir="$pkgdir/usr/share/plasma/plasmoids/org.kxn.cornerMenu"
  install -d 755 "$_pkgdir"
  cp -r package/* "$_pkgdir"
}
