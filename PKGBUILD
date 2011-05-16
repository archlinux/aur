# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=liblqr
pkgver=0.4.1
pkgrel=2
pkgdesc="A seam-carving C/C++ library called Liquid Rescale"
arch=('i686' 'x86_64')
url="http://liblqr.wikidot.com/"
license=('GPL')
depends=('glib2')
makedepends=('pkgconfig')
options=('!libtool' '!emptydirs')
source=("http://liblqr.wikidot.com/local--files/en:download-page/$pkgname-1-$pkgver.tar.bz2")

build() {
  cd "$srcdir/$pkgname-1-$pkgver"
  ./configure --prefix=/usr 
  make
}

package() {
  cd "$srcdir/$pkgname-1-$pkgver"
  make DESTDIR="$pkgdir/" install
}
md5sums=('0e24ed3c9fcdcb111062640764d7b87a')
