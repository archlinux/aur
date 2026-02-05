# Maintainer: Rodrigo Sakaguchi <rodrigosaka@outlook.com>

pkgname=gnome-pomodoro-extension
pkgver=0.28.1
pkgrel=3
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
sha256sums=('c4f832b27022ec25768e595e5566a6261ab426a552a9c209074b0596fbf772b9')

build() {
  cd "$srcdir/gnome-pomodoro-$pkgver"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir/gnome-pomodoro-$pkgver"
  meson install -C build --destdir "$pkgdir"
}
