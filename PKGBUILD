# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=addwater
pkgver=1.1.5
pkgrel=1
pkgdesc="Installer for the Firefox GNOME theme"
arch=('any')
url="https://github.com/largestgithubuseronearth/addwater"
license=('GPL-3.0-or-later')
depends=(
  'libadwaita'
  'libportal'
  'python-gobject'
  'python-requests'
)
makedepends=(
  'meson'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9aa617f0028de28195f5bda2a27e2b72264188c4a57fa43554fda59d1f778014')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
