# Maintainer: Adria Arrufat <adria.arrufat@protonmail.ch>
pkgname=lasem
pkgver=0.4.3
pkgrel=1
pkgdesc="SVG and Mathml rendering library"
arch=('i686' 'x86_64')
url="http://blogs.gnome.org/emmanuel/category/lasem/"
license=('LGPL')
depends=('gtk3')
makedepends=('intltool')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('e7d950f9579defc7bb9d4159a0bfff165a3a621945ac9f202c930f2fea2dd58f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  rm -r "$pkgdir/usr/doc"
}
