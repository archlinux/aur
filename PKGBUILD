# Contributor: Sébastien Leduc <sebastien@sleduc.fr>
# Contributor: Sven Schulz <omee@archlinux.de>
# Contributor: Christoph Zeiler <rabyte@gmail.com>
# Contributor: Leslie P. Polzer <polzer@gnu.org>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=netrik
pkgver=1.16.1
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="The ANTRIK Internet Viewer/Browser/Explorer/Navigator/whatever."
url="http://netrik.sourceforge.net/"
license=('GPL')
depends=('readline')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('73e4603491d185b0580a8fad83518f42')
sha1sums=('1331e47e8a1a19d572f0c2d58d581183089f38c2')
sha256sums=('3e742d9ef866c12075e7771148e39a6892d0dcdf70f43aecafa09e0ed925b78a')
 
prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i -e 's#<ncursesw/curses.h>#<curses.h>#g' main.c colors-dark.c colors-bright.c links.c pager.c parse-syntax.c render.c screen.c
  sed -i -e 's#<ncursesw/term.h>#<term.h>#g' render.c screen.c
}
build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=$pkgdir/usr install
}
 
