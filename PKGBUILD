# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=wike
pkgver=3.0.1
pkgrel=1
pkgdesc="Wikipedia Reader for the GNOME Desktop"
arch=('any')
url="https://apps.gnome.org/Wike"
license=('GPL-3.0-or-later')
depends=('libadwaita' 'python-gobject' 'python-requests' 'webkitgtk-6.0')
makedepends=('meson')
checkdepends=('appstream')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugolabe/Wike/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e59c9e6b11db1c1a9c3f07ba58639a0a11762aa5220d37cdce9eb5dc74d90112')

build() {
  arch-meson Wike-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
