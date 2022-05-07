# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=amberol
pkgver=0.6.0
pkgrel=1
pkgdesc="Plays music, and nothing else"
arch=('x86_64')
url="https://gitlab.gnome.org/World/amberol"
license=('GPL3')
depends=('libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good')
makedepends=('meson' 'rust')
#checkdepends=('appstream-glib' 'reuse')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar)
b2sums=('b0628f1e27f1bd890ecf722b0696dd63f86f35fd8611a294d680f280319801fa8c927f41534c4dd710e469f7e3ffc0d107063064c7b61e44abbb8c4537f79f1d')

build() {
  arch-meson --buildtype release "$pkgname-$pkgver" build
  meson compile -C build
}

#check() {
#  meson test -C build
#

package() {
  meson install -C build --destdir "$pkgdir"
}
