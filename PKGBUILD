# Maintainer: Luna Jernberg <droidbittin@gmail.com>


pkgname=gtk-radio
pkgver=550.3
pkgrel=1
pkgdesc="Easily find live radio programs based on geographical location of radio broadcasters on the Internet"
arch=('x86_64')
url="https://www.gtkradio.org/"
license=(GPL3)
depends=('libchamplain' 'gst-plugins-base' 'gst-plugins-bad')
makedepends=('intltool' 'itstool')
conflicts=('gnome-radio')
source=("http://www.gtkradio.org/src/gtk-radio-$pkgver.tar.xz")
sha256sums=('9cefb783eaa11ef4ee2ac7258bb9423d49bfc890235c903a93c878e7f7fb5855')


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


