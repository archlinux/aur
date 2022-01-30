# Maintainer: Luna Jernberg <lunajernberg@gnome.org>


pkgname=gnome-radio
pkgver=14.0.0
pkgrel=1
pkgdesc="Listen to NPO in GNOME 42 Preview of the new version of gnome-internet-radio-locator"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/Radio"
license=(GPL3)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad')
makedepends=('intltool' 'itstool' 'python')
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('f1e8aed63d12dd8a70d38ab6f7e518d4f8b54d4d548bc51d729cce0dd16e8efd')

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

