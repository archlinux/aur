# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=wike
pkgver=1.8.3
pkgrel=1
pkgdesc="Wikipedia Reader for the GNOME Desktop"
arch=('any')
url="https://apps.gnome.org/app/com.github.hugolabe.Wike"
license=('GPL3')
depends=('libhandy' 'python-gobject' 'python-requests' 'webkit2gtk-4.1')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugolabe/Wike/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('22373b623acaf63a02de2d5692654d6056dd7ad81cf425190695ebe1154ca95a')

build() {
  arch-meson Wike-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
