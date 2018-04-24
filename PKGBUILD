# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Gerardo Marset <gammer1994@gmail.com>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=adonthell
pkgver=0.3.7
pkgrel=1
pkgdesc="A 2D graphical, single player role playing game engine"
arch=('x86_64')
url="http://adonthell.nongnu.org/"
license=('GPL2')
depends=('sdl2_mixer' 'sdl2_ttf' 'python')
makedepends=('swig')
options=('emptydirs')
source=("http://savannah.nongnu.org/download/adonthell/$pkgname-src-$pkgver.tar.gz")
sha256sums=('b94258666932bbae0e2fe0bcaf31c373a55a01c8977d24b9f45e1f11887ae8b5')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
