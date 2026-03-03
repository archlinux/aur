# Maintainer: Rodrigo Sakaguchi <rodrigosaka@outlook.com>

pkgname=gnome-pomodoro-extension
pkgver=0.29.0
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
sha256sums=('82f31c1f704e0a5d993b990a4a1160bc9281dc80b359dd9727c89d7157ad3527')

build() {
  cd "$srcdir/FocusTimer-$pkgver"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir/FocusTimer-$pkgver"
  meson install -C build --destdir "$pkgdir"
}
