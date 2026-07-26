# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=xdg-desktop-portal-xapp-filepicker-git
pkgver=1.1.4.r74.b8de080
pkgrel=1
pkgdesc='A backend implementation for xdg-desktop-portal using GTK/Cinnamon with native folder selection support (git)'
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
  git
  glib2-devel
  meson
)
provides=(xdg-desktop-portal-xapp-filepicker xdg-desktop-portal-impl xdg-desktop-portal-xapp)
conflicts=(xdg-desktop-portal-xapp xdg-desktop-portal-filepicker)
source=("xdg-desktop-portal-xapp-filepicker::git+https://github.com/Twilight0/xdg-desktop-portal-xapp-filepicker.git")
sha256sums=('SKIP')

pkgver() {
  cd xdg-desktop-portal-xapp-filepicker
  printf "1.1.5.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson xdg-desktop-portal-xapp-filepicker build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
