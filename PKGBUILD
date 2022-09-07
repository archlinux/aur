# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=wike
pkgver=1.8.1
pkgrel=1
pkgdesc="Wikipedia Reader for the GNOME Desktop"
arch=('any')
url="https://apps.gnome.org/app/com.github.hugolabe.Wike"
license=('GPL3')
depends=('libhandy' 'python-gobject' 'python-requests' 'webkit2gtk')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugolabe/Wike/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8716b96e419db0b06cd0b26b89ffc47274d6b5b6a1d2de24d1a7a6d5f185967d')

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
