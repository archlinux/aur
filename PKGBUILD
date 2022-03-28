# Maintainer: Luna Jernberg <lunajernberg@gnome.org>
# Co-Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=gnome-radio
pkgver=16.0.6
pkgrel=1
pkgdesc="Easily find live radio programs based on geographical location of radio broadcasters on the Internet"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/Radio"
license=(GPL3)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad')
makedepends=('intltool' 'itstool' 'python')
conflicts=('gnome-internet-radio-locator')
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('6a66b7d840adfaf159a2ab518bbc8148014d09a4d56962e536d037f3fada1d33')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-recording
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

