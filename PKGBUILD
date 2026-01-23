# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=chronograph
pkgver=49
pkgrel=1
pkgdesc="Sync lyrics of your loved songs"
arch=('any')
url="https://github.com/Dzheremi2/Chronograph"
license=('GPL-3.0-or-later')
depends=(
  'gst-plugins-bad'
  'gstreamer'
  'gtk4'
  'libadwaita'
  'python-certifi'
  'python-charset-normalizer'
  'python-dgutils'
  'python-gobject'
  'python-httpx'
  'python-idna'
  'python-magic'
  'python-mutagen'
  'python-peewee'
  'python-pillow'
  'python-requests'
  'python-urllib3'
  'python-yaml'
)
makedepends=(
  'blueprint-compiler'
  'meson'
)
source=("Chronograph-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3816f6a6f583b34a219e3dbe618562dcd1d8c10b3668e1afc9a7a2b8786dde73')

build() {
  arch-meson "Chronograph-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
