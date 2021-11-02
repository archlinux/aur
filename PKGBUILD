# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=rnote
pkgver=0.1.6
pkgrel=1
pkgdesc="A simple note taking application written in Rust and GTK4"
arch=('x86_64')
url="https://github.com/flxzt/rnote"
license=('GPL3')
depends=('gtk4' 'glib2' 'libadwaita')
makedepends=('meson' 'rust')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
sha512sums=('341fc5a5b07fe7d4585e6cd25390052807f0223808b341fd744a94ada3178dd860aae99b3f6cac54a6258344c6b6c97be1158c6fa2f807a74abea5365711af7c')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
