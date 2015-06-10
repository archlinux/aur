# Maintainer: Alexander Rødseth <rodseth@gmail.com>
pkgname=sswf
pkgver=1.8.4
pkgrel=4
pkgdesc="Script SWF, includes an ActionScript compiler"
arch=('x86_64' 'i686')
url="http://www.m2osw.com/sswf"
license=('MIT')
depends=('bash' 'freetype2' 'libjpeg-turbo')
md5sums=('ce4879970160fee18a8f9dee9bf215ae')
source=("http://kent.dl.sourceforge.net/sourceforge/sswf/$pkgname-$pkgver-src.tar.bz2")
options=(!emptydirs)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  msg2 "Compiling..."
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  msg2 "Packaging..."
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
