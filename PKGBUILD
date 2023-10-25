# Maintainer: D3vil0p3r <vozaanthony[at]gmail[dot]com>

pkgname=plasma5-applets-bigsur-inlinebattery
pkgver=14.70890f2
pkgrel=1
pkgdesc="Improved Mac-like Inline Battery Plasmoid for KDE."
arch=(any)
url="https://github.com/Fausto-Korpsvart/mcOS-BS-Inline-Battery"
license=(CC-BY)
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

  _pkgdir="$pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.bigSur-inlineBattery"
  install -d 755 "$_pkgdir"
  cp -r contents metadata.desktop "$_pkgdir"
}
