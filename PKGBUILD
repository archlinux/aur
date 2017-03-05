# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Janne Haapsaari <haaja@iki.fi>
# Contributor: maus25 <mirko378@gmail.com>

pkgname=gnome-shell-pomodoro
pkgver=0.13.1
pkgrel=1
pkgdesc='A time management utility for GNOME based on the pomodoro technique'
arch=('i686' 'x86_64')
url='https://github.com/codito/gnome-shell-pomodoro/'
license=('GPL3')
depends=('gnome-desktop' 'libcanberra' 'gstreamer' 'gobject-introspection' 'libpeas' 'appstream-glib')
makedepends=('intltool' 'vala' 'gnome-common' 'docbook2x' 'perl-xml-sax-expat')
changelog='NEWS'
source=("https://github.com/codito/gnome-pomodoro/archive/$pkgver.tar.gz")
sha256sums=('52b27f2cef1e06eb5ab51a1fb06ac29c88bbfd825d809fc5c81d482897123318')

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
