# Contributor: archtux <antonio dot arias99999 at gmail dot com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=adcd
pkgver=1.7
pkgrel=1
pkgdesc="A cd player for GNU/Linux with a ncurses (text mode) interface."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/adcd/"
license=('GPL2')
depends=('ncurses')
source=("http://mirror.lihnidos.org/GNU/savannah/$pkgname/$pkgname-$pkgver.tar.lz")
md5sums=('cb2dd042b4f1a22c3f921e7f5ad2b440')
sha1sums=('2a47117daa2c585128883aaee8785a899801307e')
sha256sums=('410ae3f0beb0d5232a365c5ca51697a436f0b32a0cc51987a7a58f7f862d509e')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}

