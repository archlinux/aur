# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=addwater
pkgver=1.2.2
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
sha256sums=('c3a98d1f4cde4a6b26152589874b9662a4472879e24e2601bc5e987e550beb05')

build() {
  arch-meson "$pkgname-$pkgver" build -Dprofile=user
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
