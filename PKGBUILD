# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-internet-radio-locator
pkgver=12.2.0
pkgrel=1
pkgdesc="Easily find live radio programs based on geographical location of radio broadcasters on the Internet"
arch=(x86_64)
url="http://gnomeradio.org"
license=(GPL3)
depends=(libchamplain geoclue gst-plugins-base gst-plugins-bad)
makedepends=(intltool itstool python)
source=("https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('dcb58c70d36c269734972964101616c33ad255beecc815bf9c762dcb4ba8cf19')

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
