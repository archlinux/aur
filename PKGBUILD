# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=addwater
pkgver=1.0.1
pkgrel=1
pkgdesc="Installer for the Firefox GNOME theme"
arch=('any')
url="https://addwater.qwery.dev"
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/largestgithubuseronearth/addwater/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ad94fdcf997ad18fda8981a1858308e94e05fd2346689a93ce6a7d889a67ab3a')

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
