# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=rnote
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple note taking application written in Rust and GTK4"
arch=('x86_64')
url="https://github.com/flxzt/rnote"
license=('GPL3')
depends=('gtk4' 'glib2' 'libadwaita')
makedepends=('meson' 'rust')
checkdepends=('appstream-glib')
source=(https://github.com/flxzt/rnote/archive/v0.1.1.tar.gz)
sha512sums=('37849c00435949557c4242dea74d99302f0f51c29b9dafda3bdabe6747d45b2081728a51c9d3ceeb44ee3516a40d126c44f10ac535a4dabca4a9a4de71385aae')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

#check() {
#  meson test -C build --print-errorlogs
#}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
