# Submitter: Stefan Husmann <stefan-husmann at t-online dot de>
# Maintainer: John D. Corrado <jdcorrado at gmail dot com>
pkgname=sopwith
pkgver=1.8.4
pkgrel=1
pkgdesc="Sidescrolling shoot 'em up game"
url="http://sdl-sopwith.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('sdl')
source=(http://sourceforge.net/projects/sdl-$pkgname/files/sdl_$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('4bf22bd03448506602622f466480a71c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
