# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=girl
pkgver=8.0.1
pkgrel=1
pkgdesc="GNOME Internet Radio Locator"
arch=(i686 x86_64)
license=(GPL)
depends=(libgnomeui totem streamripper desktop-file-utils)
makedepends=(intltool)
url="https://wiki.gnome.org/Apps/Girl"
install=girl.install
source=(https://download.gnome.org/sources/$pkgname/${pkgver:0:3}/$pkgname-$pkgver.tar.xz)
sha256sums=('a2fa78b0b9e61842f85c1ba371b6c61d20d48a3a2672a2e3871b2135bc177db2')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-recording
  make
}

package(){
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
