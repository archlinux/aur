# Maintainer: Luna Jernberg <droidbittin@gmail.com>


pkgname=gtk-radio
pkgver=264.3
pkgrel=1
pkgdesc="Easily find live radio programs based on geographical location of radio broadcasters on the Internet"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/Radio"
license=(GPL3)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad' 'geocode-glib-2' 'libsoup3')
makedepends=('intltool' 'itstool' 'python')
conflicts=('gnome-radio')
replaces=('gnome-radio')
source=(http://www.gtkradio.org/src/gtk-radio-264.3.tar.xz)
sha256sums=('7fb2b2a5be259958eef28a3312b0b11bf27418c46ac3cd7002de0d89d717357a')


prepare() {
  cd $pkgname-$pkgver
  sed -i 's|geocode-glib-1.0|geocode-glib-2.0|' configure
 }

build() {
  cd $pkgname-$pkgver
  ./configure
  make
}

check(){
  cd $pkgname-$pkgver
  make
}

package(){
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}


