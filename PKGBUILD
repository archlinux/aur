# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-nightthemeswitcher
_pkgname=nightthemeswitcher-gnome-shell-extension
pkgver=61
pkgrel=1
pkgdesc="Automatically toggle your light and dark themes variants"
arch=('any')
url="https://gitlab.com/rmnvgr/nightthemeswitcher-gnome-shell-extension"
license=('GPL3')
groups=('gnome-shell-extensions')
depends=('gnome-shell>=1:42')
makedepends=('glib2' 'meson')
source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar)
b2sums=('01ccfd904e70b09b6df13bb08f156e43527065643c48d3df598b497b5f9737a54fbd44759576d2f99f36b1bee3bed49f35d6a85c613243bb0bb816787902197f')

build() {
  arch-meson "${_pkgname}-${pkgver}" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
