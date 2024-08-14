# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=wike
pkgver=3.1.0
pkgrel=1
pkgdesc="Wikipedia Reader for the GNOME Desktop"
arch=('any')
url="https://apps.gnome.org/Wike"
license=('GPL-3.0-or-later')
depends=('libadwaita' 'python-gobject' 'python-requests' 'webkitgtk-6.0')
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugolabe/Wike/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('825dc5ac2dd732bae1384349f0a1d6a8e3b5df89857fb2b0280b15f59a11a2ee')

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
