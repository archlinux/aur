# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=girl
pkgver=10.0.0
pkgrel=1
pkgdesc="GNOME Internet Radio Locator"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/Girl"
license=(GPL)
depends=(gst-plugins-base-libs libgnomeui streamripper totem)
makedepends=(gtk-doc intltool itstool)
source=(https://download.gnome.org/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz)
sha256sums=('4ad194862b4366334aef297161b55edb42a152196fae84d905d551680accde36')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --enable-gtk-doc
  make
}

check(){
  cd $pkgname-$pkgver
  make check
}

package(){
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
