# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=emblem
pkgver=0.1.2
pkgrel=1
pkgdesc="Generate project avatars for your Matrix rooms an git forges"
arch=('x86_64')
url="https://gitlab.gnome.org/World/design/emblem"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'glib2')
makedepends=('meson' 'rust')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar)
sha512sums=('319d46bab4c689e98dfa9160d32d17aa205679f23892864913bb40a3cd165235f03b8629d3c86ec3d85b86c22de0e2001501255500201a3dc71b9797a3d5a4f7')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
