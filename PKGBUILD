# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Christoph Zeiler <rabyte*gmail>
# Maintainer: yugrotavele <yugrotavele at archlinux dot us>

pkgname=flatzebra
pkgver=0.1.6
pkgrel=1
pkgdesc="A generic game engine for 2D double-buffering animation"
arch=('i686' 'x86_64')
url="http://perso.b2b2c.ca/sarrazip/dev/burgerspace.html"
license=('GPL')
depends=('gcc-libs' 'sdl_image>=1.2' 'sdl_mixer')
options=('!libtool')
source=(http://perso.b2b2c.ca/sarrazip/dev/$pkgname-$pkgver.tar.gz)
md5sums=('68cbaa37b88de639ceb6e4c46807fc01')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
