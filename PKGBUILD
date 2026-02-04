# Maintainer: Liam Timms <timms5000@gmail.com>
# Contributor: gj545rndmu <6zogm6z2nh at bljvf anonbox net>
# Contributor: Pranav Jerry <libreinator@disroot.org>
# Contributor:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Janne Haapsaari <haaja@iki.fi>
# Contributor: maus25 <mirko378@gmail.com>

pkgname=gnome-shell-pomodoro
pkgver=0.28.1
pkgrel=1
pkgdesc='A time management utility for GNOME based on the pomodoro technique'
arch=('i686' 'x86_64')
url='https://github.com/gnome-pomodoro/gnome-pomodoro'
license=('GPL3')
depends=('gobject-introspection' 'glib2' 'gom' 'gtk3' 'cairo' 'glibc' 'libpeas' 'sqlite' 'gstreamer' 'libcanberra')
makedepends=('meson' 'vala')
source=("$pkgname-$pkgver.tar.gz::https://github.com/focustimerhq/FocusTimer/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ab8136fe4e585941d67dbb7a81e2442285a0cbeead47fb1c99a37ffd473a4e53')

prepare() {
  cd "$srcdir/focus-timer-$pkgver"
}

build() {
  cd "$srcdir/focus-timer-$pkgver"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir/focus-timer-$pkgver"
  meson install -C build --destdir "$pkgdir"
}

