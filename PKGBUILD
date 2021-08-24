# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=mousai
pkgver=0.6.1
pkgrel=1
pkgdesc="Simple application for identifying songs"
arch=('x86_64')
url="https://github.com/SeaDve/Mousai"
license=('GPL3')
depends=('gstreamer' 'gtk4' 'libadwaita-git' 'python-gobject' 'python-requests')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8f68c57e9364439902f9442c1e5217c187c75d24c86c91e53bd9a021fba90286')

build() {
  arch-meson Mousai-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
