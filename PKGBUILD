# Maintainer: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Laurent Carlier <lordheavym at gmail.com>
# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: oscarello <estrada.oscar@gmail.com>

pkgname=burgerspace
pkgver=1.9.2
pkgrel=1
pkgdesc="A clone of the 1982 BurgerTime video game by Data East"
arch=('i686' 'x86_64')
url="http://perso.b2b2c.ca/sarrazip/dev/$pkgname.html"
license=('GPL')
depends=('sdl_image' 'sdl_mixer' 'flatzebra>=0.1.6')
makedepends=('autoconf' 'automake')
source=(http://perso.b2b2c.ca/sarrazip/dev/$pkgname-$pkgver.tar.gz)
md5sums=('8675449bb1c3c014bc51837b60f6cc47')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}