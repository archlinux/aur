# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=libsvg
pkgver=0.1.4
pkgrel=6
pkgdesc="A library for rendering SVG documents"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://cairographics.org/"
depends=('libxml2')
source=(https://cairographics.org/snapshots/$pkgname-$pkgver.tar.gz \
  libpng14.patch)
md5sums=('ce0715e3013f78506795fba16e8455d3'
         '76eee76d69e79dddbe6de8c75ed0ac1c')
options=('!libtool')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  patch -p1 < "$srcdir"/libpng14.patch
  make
}
package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
