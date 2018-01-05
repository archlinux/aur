# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=vorbissimple
pkgver=0.0.2
pkgrel=4
pkgdesc="A Vorbis decoder"
arch=('x86_64')
url="http://kamaelia.sourceforge.net"
license=('GPL')
depends=('libvorbis')
source=(https://downloads.sourceforge.net/kamaelia/$pkgname-$pkgver.tar.gz)
sha256sums=('0e02a723549b8f2c5d720d9cc830c039b9fc842e8845e6c2cecec96fa1bdceb0')

build() {
  cd "$srcdir"/$pkgname-$pkgver/libvorbissimple
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver/libvorbissimple
  make DESTDIR="$pkgdir" install
}
