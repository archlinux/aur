# Maintainer: Rodrigo Sakaguchi <rodrigosaka@outlook.com>

pkgname=gnome-pomodoro-extension
pkgver=0.28.0
pkgrel=1
pkgdesc='GNOME Shell extension that manages focus and break cycles with the Pomodoro technique'
arch=('i686' 'x86_64')
url='https://github.com/gnome-pomodoro/gnome-pomodoro'
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
)
makedepends=('meson' 'vala')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gnome-pomodoro/gnome-pomodoro/archive/$pkgver.tar.gz")
sha256sums=('31c0ad477dc4f22e3c4fa284b51a415faa2e807f91aa580798b07f90973b7271')

build() {
  cd "$srcdir/gnome-pomodoro-$pkgver"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir/gnome-pomodoro-$pkgver"
  meson install -C build --destdir "$pkgdir"
}
