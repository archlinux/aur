# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=chronograph
pkgver=5.3.1
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
sha256sums=('6879850454ffb9b6c81d8b30b9ebdfd6c8e62556616a586c109e587fae213bd3')

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
