# Maintainer: Twilight0 <twilight0@vivaldi.net>
# Contributor: Mark Wagie

pkgname=xdg-desktop-portal-filepicker
pkgver=1.1.4.r73.35f454d
pkgrel=1
pkgdesc='A backend implementation for xdg-desktop-portal using GTK/Cinnamon with native folder selection support'
arch=(x86_64)
url='https://github.com/Twilight0/xdg-desktop-portal-filepicker'
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
  git
  glib2-devel
  meson
)
provides=(xdg-desktop-portal-impl)
conflicts=()
source=("xdg-desktop-portal-filepicker::git+https://github.com/Twilight0/xdg-desktop-portal-filepicker.git")
sha256sums=('SKIP')

pkgver() {
  cd xdg-desktop-portal-filepicker
  printf "1.1.4.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson xdg-desktop-portal-filepicker build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

