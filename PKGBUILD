# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-nightthemeswitcher
pkgver=83
pkgrel=1
pkgdesc="Automatically toggle your light and dark themes variants"
arch=(any)
url=https://gitlab.com/rmnvgr/nightthemeswitcher-gnome-shell-extension
license=(GPL-3.0-or-later)
depends=(gnome-shell)
makedepends=(git meson npm)
source=($pkgname::git+$url.git#tag=$pkgver)
sha256sums=('31193e496f82aaeb123560f32bc26d8896cae8b031c377d0bad3bc02ef6540d9')

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
