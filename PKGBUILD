# Maintainer: Luna Jernberg <droidbittin@gmail.com>


pkgname=gtk-radio
pkgver=512.0
pkgrel=1
pkgdesc="Easily find live radio programs based on geographical location of radio broadcasters on the Internet"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/Radio"
license=(GPL3)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad' 'geocode-glib-2' 'libsoup3')
makedepends=('intltool' 'itstool' 'python')
conflicts=('gnome-radio')
replaces=('gnome-radio')
source=(http://www.gtkradio.org/src/gtk-radio-512.0.tar.xz)
sha256sums=('630b80c9b251ce4bb673f8470ca3f8bdcf44d64df20cbc4730c80c4cb7700a3e')


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


