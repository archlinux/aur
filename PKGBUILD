# Maintainer: Luna Jernberg <droidbittin@gmail.com>


pkgname=gtk-radio
pkgver=264.1
pkgrel=1
pkgdesc="Easily find live radio programs based on geographical location of radio broadcasters on the Internet"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/Radio"
license=(GPL3)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad' 'geocode-glib-2')
makedepends=('intltool' 'itstool' 'python')
conflicts=('gnome-radio')
replaces=('gnome-radio')
source=(http://www.gtkradio.org/src/gtk-radio-264.1.tar.xz)
sha256sums=('4e310776295c8ef357850f67021989cf932c0f0c549fb78f3d36e2706ab5178b')


prepare() {
  cd $pkgname-$pkgver
 }

build() {
  cd $pkgname-$pkgver
  ./configure
  make
}

check(){
  cd $pkgname-$pkgver
  make check -k
}

package(){
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}


