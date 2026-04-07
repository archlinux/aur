# Maintainer: Luna Jernberg <lunajernberg@gnome.org>


pkgname=gtk-internet-radio-locator
pkgver=4.9.3
pkgrel=1
pkgdesc="Easily find live radio programs based on geographical location of radio broadcasters on the Internet"
arch=('x86_64')
url="https://www.gtk.audio/"
license=(GPL-3.0-only)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad' 'geocode-glib-2' 'goocanvas2')
makedepends=('intltool' 'itstool' 'python')
conflicts=('gnome-radio')
replaces=('gnome-radio')
source=(https://gtk.audio/src/gtk-internet-radio-locator-4.9.3.tar.xz)
sha256sums=('a4c5979e98876abfcaffe30429c2cd6e4818d49c8efed3ea17816328db06adf8')

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

