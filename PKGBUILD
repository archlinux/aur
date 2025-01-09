# Maintainer: Luna Jernberg <droidbittin@gmail.com>


pkgname=gtk-radio
pkgver=552.0
pkgrel=1
pkgdesc="Easily find live radio programs based on geographical location of radio broadcasters on the Internet"
arch=('x86_64')
url="https://www.gtkradio.org/"
license=(GPL3)
depends=('libchamplain' 'gst-plugins-base' 'gst-plugins-bad')
makedepends=('intltool' 'itstool')
conflicts=('gnome-radio')
source=("http://www.gtkradio.org/src/gtk-radio-$pkgver.tar.xz")
sha256sums=('95f16752049bf9c1ecbc5054d8ad6d851dbcb2b8e6f5e12d1e25ae6735913526')


prepare() {
  cd $pkgname-$pkgver

 }

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
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


