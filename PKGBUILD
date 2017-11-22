# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Janne Haapsaari <haaja@iki.fi>
# Contributor: maus25 <mirko378@gmail.com>

pkgname=gnome-shell-pomodoro
pkgver=0.13.4
pkgrel=1
pkgdesc='A time management utility for GNOME based on the pomodoro technique'
arch=('i686' 'x86_64')
url='https://github.com/codito/gnome-pomodoro'
license=('GPL3')
depends=('gnome-desktop' 'libcanberra' 'gstreamer' 'gobject-introspection' 'libpeas' 'appstream-glib')
makedepends=('intltool' 'vala' 'gnome-common' 'docbook2x' 'perl-xml-sax-expat')
changelog='NEWS'
source=("$pkgname-$pkgver.tar.gz::https://github.com/codito/gnome-pomodoro/archive/$pkgver.tar.gz")
sha256sums=('e1dc54b3beefa51468df9743bf7e55cc656c2a2ead2ab3598f3c58ce25397aad')

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
