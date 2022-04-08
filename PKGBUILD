# Maintainer: fpaskali <paskali2005 at gmail>
pkgname=libflatzebra
pkgver=0.1.7
pkgrel=1
pkgdesc="A generic game engine for 2D double-buffering animation"
arch=('any')
url="http://perso.b2b2c.ca/~sarrazip/dev/burgerspace.html"
license=('GPL')
groups=()
depends=('sdl' 'sdl_image' 'sdl_mixer')
source=("http://perso.b2b2c.ca/~sarrazip/dev/flatzebra-${pkgver}.tar.gz")
sha512sums=('12afbb0ef00dfac21654961da8d2101e9b7b0e6550b9e66bfb4da4faf77cc1dfb7f3da15c8b84c19379eb1ff8bac09324acc694f9282b74ae73a7379686f2374')

build() {
  cd "${srcdir}/flatzebra-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/flatzebra-${pkgver}"

  make DESTDIR="$pkgdir/" install
}