# Maintainer: Rodrigo Sakaguchi <rodrigosaka@outlook.com>

pkgname=gnome-pomodoro-extension
pkgver=1.1.0
pkgrel=2
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
sha256sums=('844a04039fedad6e6d8c4920f6c414fd31e70486b8792cd641c479896a59c97e')

build() {
  cd "$srcdir/FocusTimer-$pkgver"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir/FocusTimer-$pkgver"
  meson install -C build --destdir "$pkgdir"
}
