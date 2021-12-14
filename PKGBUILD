# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=rnote
pkgver=0.2.0
pkgrel=1
pkgdesc="A simple note taking application written in Rust and GTK4"
arch=('x86_64')
url="https://github.com/flxzt/rnote"
license=('GPL3')
depends=('gtk4' 'glib2' 'libadwaita' 'poppler-glib')
makedepends=('meson' 'rust')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('3ae11558e203e1c55f232f22ac30e370d4e974b827b33482031cd29a6d75e49508948954d3e7f6f558cc14869505fa4a2ae5512a642ab47c719a057f354a0b50')

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
