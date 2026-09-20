# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=xdg-desktop-portal-aliveos
pkgver=1.2.0
pkgrel=1
pkgdesc='A backend implementation for xdg-desktop-portal with native AliveOS multi-view file chooser dialog'
arch=(x86_64)
url='https://github.com/Twilight0/xdg-desktop-portal-aliveos'
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
provides=(xdg-desktop-portal-aliveos xdg-desktop-portal-impl xdg-desktop-portal-xapp xdg-desktop-portal-xapp-filepicker)
conflicts=(xdg-desktop-portal-xapp xdg-desktop-portal-filepicker xdg-desktop-portal-xapp-filepicker xdg-desktop-portal-xapp-filepicker-git)
replaces=(xdg-desktop-portal-xapp-filepicker)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Twilight0/xdg-desktop-portal-aliveos/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('39b0810093405c637f92a9dd5e6cbf3825e46a6cf0258002f4fe5219174100de')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
