# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=xdg-desktop-portal-xapp-filepicker
pkgver=1.1.4
pkgrel=1
pkgdesc='A backend implementation for xdg-desktop-portal using GTK/Cinnamon with native folder selection support'
arch=(x86_64)
url='https://github.com/Twilight0/xdg-desktop-portal-xapp-filepicker'
license=(LGPL-2.1-or-later)
depends=(
  gcc-libs
  glib2
  glibc
  gtk3
  xapp
  xapp-symbolic-icons
  xdg-desktop-portal
  xdg-desktop-portal-gtk
)
makedepends=(
  glib2-devel
  meson
)
provides=(xdg-desktop-portal-xapp-filepicker xdg-desktop-portal-impl xdg-desktop-portal-xapp)
conflicts=(xdg-desktop-portal-xapp xdg-desktop-portal-filepicker)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Twilight0/xdg-desktop-portal-xapp-filepicker/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
