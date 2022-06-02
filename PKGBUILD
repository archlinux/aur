# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=warp-share-files
_pkgname=warp
pkgver=0.1.2
pkgrel=2
pkgdesc="Share files with each other effortlessly"
arch=('x86_64')
url="https://gitlab.gnome.org/World/warp"
license=('GPL3')
depends=('glib2' 'libadwaita' 'magic-wormhole')
makedepends=('meson' 'rust' 'itstool')
checkdepends=('appstream-glib')
source=($url/-/archive/v$pkgver/$_pkgname-v$pkgver.tar)
b2sums=('742bde1c4a1aa42ff8eef1b5f56ffd4b92fb623827c7bc1e554b45a3d6275c4343a1e1d19cd6d7f212c699d578ecc091d650afc16e8644f500a40c2e1539516c')

build() {
  arch-meson "$_pkgname-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
