# Maintainer: Rodrigo Sakaguchi <rodrigosaka@outlook.com>

pkgname=gnome-pomodoro-extension
pkgver=0.28.1
pkgrel=4
pkgdesc='GNOME Shell extension that manages focus and break cycles with the Pomodoro technique'
arch=('i686' 'x86_64')
url='https://github.com/focustimerhq/FocusTimer'
license=('GPL3')
depends=(
  'glib2'
  'gtk3'
  'gom'
  'libpeas'
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
sha256sums=('ab8136fe4e585941d67dbb7a81e2442285a0cbeead47fb1c99a37ffd473a4e53')

build() {
  cd "$srcdir/FocusTimer-$pkgver"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir/FocusTimer-$pkgver"
  meson install -C build --destdir "$pkgdir"
}
