# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Gerardo Marset <gammer1994@gmail.com>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=adonthell
pkgver=0.3.8
pkgrel=1
pkgdesc="A 2D graphical, single player role playing game engine"
arch=('x86_64')
url="http://adonthell.nongnu.org/"
license=('GPL2')
depends=('sdl2_mixer' 'sdl2_ttf' 'python')
makedepends=('swig')
options=('emptydirs')
source=("http://savannah.nongnu.org/download/adonthell/$pkgname-src-$pkgver.tar.gz")
sha256sums=('c006f95bc58f095eff1a6b4bfc3ec96a455c76cdc8b64c4b2430ad7775c2ccec')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
