# Maintainer: David Adler <d.adler@posteo.de>
_pkgname=jm2cv
pkgname=$_pkgname-git
pkgver=20130518
pkgrel=2
pkgdesc="Converts between JACK MIDI and CV control voltage"
arch=('x86_64')
url="https://github.com/harryhaaren/jm2cv"
license=('GPL')
depends=('jack')
makedepends=('git' 'cmake')
provides=('jm2cv')
conflicts=('jm2cv')
source=("$_pkgname::git+https://github.com/harryhaaren/jm2cv.git")
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

