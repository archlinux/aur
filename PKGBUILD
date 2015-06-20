# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=girl
pkgver=1.0.0
pkgrel=1
pkgdesc="GNOME Internet Radio Locator"
arch=(i686 x86_64)
license=(GPL)
depends=(libgnomeui totem streamripper)
makedepends=(intltool)
url="https://wiki.gnome.org/Apps/Girl"
install=girl.install
source=(https://download.gnome.org/sources/$pkgname/${pkgver:0:3}/$pkgname-$pkgver.tar.xz)
sha256sums=('db2371ac35994c21dcddf8ade0d20109ecd871e43a470f464edc97a5477da0bf')

#https://download.gnome.org/sources/girl/1.0/girl-1.0.0.tar.xz
build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-streamripper
  make
}

package(){
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
