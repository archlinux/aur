# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=typography
pkgver=0.2.0
pkgrel=1
pkgdesc="Tool for working with the GNOME typography design guidelines"
arch=('x86_64')
url="https://gitlab.gnome.org/World/design/typography"
license=('GPL3')
depends=('gtk4' 'libadwaita')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('6efd047840ba1b0b9b231e73e0e2a0ffc10d134f152ae73181c2574192dca57fc2a33fdb8845a71cda43d1c9a27d3332f8ed42ed0676a4c6d4e0579c09ea3202')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
