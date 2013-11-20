# Contributor: Tom Killian <tom@archlinux.org>
# Contributor: Nikos Kouremenos (zeppelin) kourem at gmail dot com
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=autocutsel
pkgver=0.9.1
pkgrel=1
pkgdesc="synchronizes the two copy/paste buffers mainly used by X applications"
arch=('i686' 'x86_64')
depends=('libxaw')
source=(https://github.com/sigmike/autocutsel/releases/download/$pkgver/autocutsel-$pkgver.tar.gz)
url="http://www.nongnu.org/autocutsel/"
install=autocutsel.install
license=('GPL')
md5sums=('7bf76b1ea7a15592f05d02b4c086d4cd')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=$pkgdir/usr install 
}
