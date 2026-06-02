# Maintainer: Rodrigo Sakaguchi <rodrigosaka@outlook.com>

pkgname=gnome-pomodoro-extension
pkgver=1.1.2
pkgrel=1
pkgdesc='GNOME Shell extension that manages focus and break cycles with the Pomodoro technique'
arch=('i686' 'x86_64')
url='https://github.com/focustimerhq/FocusTimer'
license=('GPL-3.0-or-later')
depends=(
  'glib2'
  'gtk4'
  'libadwaita'
  'graphene'
  'pango'
  'gom'
  'libpeas-2'
  'wayland'
  'sqlite'
  'gstreamer'
  'json-glib'
  'cairo'
  'gobject-introspection'
  'dconf'
  'hicolor-icon-theme'
)
makedepends=('meson' 'vala' )
source=("$pkgname-$pkgver.tar.gz::https://github.com/focustimerhq/FocusTimer/archive/$pkgver.tar.gz")
sha256sums=('726ae7e87ba7b488c7fcb472a6f95469ccae3a32bfbfe15954a68de6d35f5977')

build() {
  cd "$srcdir/FocusTimer-$pkgver"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir/FocusTimer-$pkgver"
  meson install -C build --destdir "$pkgdir"
}
