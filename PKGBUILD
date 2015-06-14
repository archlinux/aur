# Submitter: Tobias Eriksson <tobier at tobier dot se>
# Maintainer: John D. Corrado <jdcorrado at gmail dot com>
pkgname=pom1
pkgver=1.0.0
pkgrel=1
pkgdesc="Apple 1 emulator"
arch=('i686' 'x86_64')
url="http://pom1.sourceforge.net/"
license=('GPL2')
depends=('sdl')
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('0c878aa8ef8a0f400b7ce4d58025a711')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
