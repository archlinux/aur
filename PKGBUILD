# Maintainer: Rodrigo Sakaguchi <rodrigosaka@outlook.com>

pkgname=gnome-pomodoro-extension
pkgver=1.0
pkgrel=1
pkgdesc='GNOME Shell extension that manages focus and break cycles with the Pomodoro technique'
arch=('i686' 'x86_64')
url='https://github.com/focustimerhq/FocusTimer'
license=('GPL3')
depends=(
  'glib2'
  'gtk3'
  'gom'
  'libpeas-2'
  'sqlite'
  'gstreamer'
  'libcanberra'
  'json-glib'
  'cairo'
  'gdk-pixbuf2'
  'gobject-introspection'
)
makedepends=('meson' 'vala')
source=("$pkgname-$pkgver.tar.gz::https://github.com/focustimerhq/FocusTimer/archive/$pkgver.tar.gz")
sha256sums=('1d8d6adcb83d74ae5c05a9caa988bf5dd0c2876af83d3df3588d27f2ee5cf9ab')

build() {
  cd "$srcdir/FocusTimer-$pkgver"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir/FocusTimer-$pkgver"
  meson install -C build --destdir "$pkgdir"
}
