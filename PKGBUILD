# Maintainer: Luna Jernberg <droidbittin@gmail.com>


pkgname=gtk-radio
pkgver=550.1
pkgrel=1
pkgdesc="Easily find live radio programs based on geographical location of radio broadcasters on the Internet"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/Radio"
license=(GPL3)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad' 'geocode-glib-2' 'libsoup3')
makedepends=('intltool' 'itstool' 'python')
conflicts=('gnome-radio')
replaces=('gnome-radio')
source=(http://www.gtkradio.org/src/gtk-radio-550.1.tar.xz)
sha256sums=('fbadde374e4d1beadc1084adfcdb3953c6f4644ff1f3ac2ae912b587b8b74f42')


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
  make
}

package(){
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}


