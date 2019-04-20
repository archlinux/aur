# Maintainer: David Adler <d dot adler at posteo dot de>
_pkgname=jm2cv
pkgname=$_pkgname-git
pkgver=20130518
pkgrel=2
pkgdesc="converts between JACK MIDI and CV control voltage"
arch=('x86_64')
url="http://git.fuzzle.org/cgit/jm2cv.git/"
license=('GPL')
depends=('jack')
makedepends=('git' 'cmake')
provides=('jm2cv')
conflicts=('jm2cv')
source=("$_pkgname::git+http://git.fuzzle.org/cgit/jm2cv.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  cmake -D CMAKE_INSTALL_PREFIX="$pkgdir/usr" .
  make
}

package() {
  cd "$srcdir/$_pkgname" 
  make install
}

