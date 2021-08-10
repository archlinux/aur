# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=mousai
pkgver=0.5.2
pkgrel=1
pkgdesc="Simple application for identifying songs"
arch=('x86_64')
url="https://github.com/SeaDve/Mousai"
license=('GPL3')
depends=('gstreamer' 'gtk4' 'libadwaita-git' 'python-gobject' 'python-requests')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cff74a75f37c94600ae020a200d32b626730ad25ef7ab77a0363bf19d1057fae')

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
