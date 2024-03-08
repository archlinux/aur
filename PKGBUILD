# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=wike
pkgver=3.0.0
pkgrel=1
pkgdesc="Wikipedia Reader for the GNOME Desktop"
arch=('any')
url="https://apps.gnome.org/Wike"
license=('GPL-3.0-or-later')
depends=('libadwaita' 'python-gobject' 'python-requests' 'webkitgtk-6.0')
makedepends=('meson')
checkdepends=('appstream')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugolabe/Wike/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b165e42dcb63f7fc4aa8ee27ae88b29a55c6abea5c6941cbce270afcb1a8306b')

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
