# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=immix
pkgver=1.3_2
pkgrel=2
pkgdesc="Aligns and merges a set of similar images in order to decrease their noise"
arch=('i686' 'x86_64')
url="http://immix.sourceforge.net/"
license=('GPL3')
depends=('fftw' 'qt4' 'exiv2')
source=(http://downloads.sourceforge.net/sourceforge/immix/immix-${pkgver%_*}-${pkgver#*_}.tar.gz)
md5sums=('05fd352475a0ba6e663ac50e365336c6')

prepare() {
  cd "$srcdir/$pkgname-${pkgver%_*}"

  sed -i 's|lrelease |lrelease-qt4 |' immix.pro
}

build() {
  cd "$srcdir/$pkgname-${pkgver%_*}"

  qmake-qt4
  make
}

package() {
  cd "$srcdir/$pkgname-${pkgver%_*}"

  make INSTALL_ROOT="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
