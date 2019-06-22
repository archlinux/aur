_pkgname=open-uri-context-menu
pkgname=gedit-$_pkgname-git
pkgver=r40.fcb008b
pkgrel=2
pkgdesc="Gedit plugin that adds context menu item to open an URI at the pointer position."
arch=("any")
url="https://github.com/jpfleury/$_pkgname"
depends=('gedit' 'xdg-utils')
source=("git+$url.git")
sha256sums=('SKIP')
license=("GPL3")
_plugindir="/usr/lib/gedit/plugins/"

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p "$pkgdir/$_plugindir"
  install -Dm644 $_pkgname.{plugin,py} "$pkgdir/$_plugindir"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
