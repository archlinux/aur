# Maintainer: Luna Jernberg <droidbittin@gmail.com>


pkgname=gtk-radio
pkgver=549.0
pkgrel=1
pkgdesc="Easily find live radio programs based on geographical location of radio broadcasters on the Internet"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/Radio"
license=(GPL3)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad' 'geocode-glib-2' 'libsoup3')
makedepends=('intltool' 'itstool' 'python')
conflicts=('gnome-radio')
replaces=('gnome-radio')
source=(http://www.gtkradio.org/src/gtk-radio-549.0.tar.xz)
sha256sums=('36f497a00751803395735807728ee67e83ce0699cccc83ffb6f8c522f0337ffd')


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


