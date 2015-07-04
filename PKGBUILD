# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=girl
pkgver=6.0.0
pkgrel=1
pkgdesc="GNOME Internet Radio Locator"
arch=(i686 x86_64)
license=(GPL)
depends=(libgnomeui totem streamripper desktop-file-utils)
makedepends=(intltool)
url="https://wiki.gnome.org/Apps/Girl"
install=girl.install
source=(https://download.gnome.org/sources/$pkgname/${pkgver:0:3}/$pkgname-$pkgver.tar.xz)
#https://download.gnome.org/sources/girl/
sha256sums=('64df1348559b988d460971ec966b9ad1ccf2c277801cff07f4ce2696675cccaf')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-streamripper
  make
}

package(){
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
