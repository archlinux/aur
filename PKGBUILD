# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=amberol
pkgver=0.6.1
pkgrel=1
pkgdesc="Plays music, and nothing else"
arch=('x86_64')
url="https://gitlab.gnome.org/World/amberol"
license=('GPL3')
depends=('libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good')
makedepends=('meson' 'rust')
#checkdepends=('appstream-glib' 'reuse')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar)
b2sums=('99f594cfb72103ee394197583609cc20ce08c180267c6ed2769ca341e60829a01142abc559e5d68a2ba9f6b4ce6d3d24f965eb854ab620d7c00f889644233c6c')

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
