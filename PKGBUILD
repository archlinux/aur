# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-nightthemeswitcher
pkgver=84
pkgrel=1
pkgdesc="Automatically toggle your light and dark themes variants"
arch=(any)
url=https://gitlab.com/rmnvgr/nightthemeswitcher-gnome-shell-extension
license=(GPL-3.0-or-later)
depends=(gnome-shell)
makedepends=(git meson npm)
source=("$pkgname::git+$url.git#tag=$pkgver")
sha256sums=('4d65ae5a5e9f935314ee58fd60152c54534d4c117dd7cfd73474d01e08eca991')

build() {
  cd $pkgname
  arch-meson . build
  meson compile -C build
}

package() {
  cd $pkgname
  meson install -C build --destdir "$pkgdir"
}

# vim: set ts=2 sw=2 et:
