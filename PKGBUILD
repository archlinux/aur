# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=amberol
pkgver=0.7.0
pkgrel=1
pkgdesc="Plays music, and nothing else"
arch=('x86_64')
url="https://gitlab.gnome.org/World/amberol"
license=('GPL3')
depends=('libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good')
makedepends=('meson' 'cargo')
#checkdepends=('appstream-glib' 'reuse')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar)
b2sums=('7ad0113612f32bb29242096a3c207e4eabd4fb1f9dcbe9416f7f218cb0d2e14219559cdb7aa9ab167ba2d8ebfca9e997315e44b2aad95f0ae30b2e46d08ee01c')

build() {
  arch-meson --buildtype release "$pkgname-$pkgver" build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
