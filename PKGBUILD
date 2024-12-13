# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=addwater
pkgver=1.2
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
sha256sums=('19028d6531a971e7195f08a288bbfc06fac0e030d814f1dc872c4467ccb82a9c')

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
