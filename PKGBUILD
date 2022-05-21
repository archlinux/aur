# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=amberol
pkgver=0.6.3
pkgrel=1
pkgdesc="Plays music, and nothing else"
arch=('x86_64')
url="https://gitlab.gnome.org/World/amberol"
license=('GPL3')
depends=('libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good')
makedepends=('meson' 'rust')
#checkdepends=('appstream-glib' 'reuse')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar)
b2sums=('86ef4fda8d09a68fe6908bbc23012913185a63281f31c18030ccd646742f600a85d525de77bd9f77b21338122ff254a580d24d7b11ef279f95fe3ab6ca55ed94')

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
