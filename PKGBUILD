# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=libsvg-cairo
pkgver=0.1.6
pkgrel=11
pkgdesc="A library for rendering SVG documents"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://cairographics.org/snapshots"
depends=('cairo>=1.4.6' 'libjpeg' 'libsvg')
makedepends=('libpng')
source=(https://cairographics.org/snapshots/$pkgname-$pkgver.tar.gz)
md5sums=('d79da7b3a60ad8c8e4b902c9b3563047')
options=(!libtool)

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --disable-static 
  make 
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install 
}
