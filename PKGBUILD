# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=cattle
pkgver=1.0.1
pkgrel=1
pkgdesc='Toolkit for the Brainfuck programming language'
arch=('x86_64' 'i686')
url='http://kiyuko.org/software/cattle'
license=('GPL')
depends=('glib2')
options=('!libtool')
source=("$pkgname-$pkgver.tgz::http://kiyuko.org/software/$pkgname/releases/1.0.1/source")
sha256sums=('7265ab3eff8ec00480f4245a617a0f12aea509f3286cecb8aa28bb6e2933caa9')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:
