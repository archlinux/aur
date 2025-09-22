# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=chronograph
pkgver=4.2.1
pkgrel=1
pkgdesc="Sync lyrics of your loved songs"
arch=('any')
url="https://github.com/Dzheremi2/Chronograph"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'python-certifi'
  'python-charset-normalizer'
  'python-dgutils'
  'python-gobject'
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
sha256sums=('2c1ec59e5f76522cb37c339cdf774ce81ddb72699591d9e84e235687b60a2f6d')

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
