# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Janne Haapsaari <haaja@iki.fi>
pkgname=gnome-shell-pomodoro
pkgver=0.10.3
pkgrel=4
pkgdesc="A time management utility for GNOME based on the pomodoro technique"
arch=('i686' 'x86_64')
url="https://github.com/codito/gnome-shell-pomodoro/"
license=('GPL3')
depends=('gnome-desktop' 'libcanberra' 'upower' 'gstreamer' 'gobject-introspection')
makedepends=('intltool' 'vala' 'gnome-common')
conflicts=('gnome-shell-pomodoro-git')
source=("https://github.com/codito/gnome-pomodoro/archive/$pkgver.tar.gz")
sha256sums=('e8ad7170a03e92dba251de2687d5c0a15db5b0ff1d8f64f5b2b2d6016bb8d2ab')
install='gschemas.install'

prepare() {
  cd "$srcdir/gnome-pomodoro-$pkgver"
  ./autogen.sh --prefix=/usr --datadir=/usr/share
}

build() {
  cd "$srcdir/gnome-pomodoro-$pkgver"
  make
}

package() {
  cd "$srcdir/gnome-pomodoro-$pkgver"
  make DESTDIR="$pkgdir" install
}
