# Maintainer: fpaskali <paskali2005 at gmail>
pkgname=libflatzebra
pkgver=0.2.0
pkgrel=1
pkgdesc="A generic game engine for 2D double-buffering animation"
arch=('any')
url="http://perso.b2b2c.ca/~sarrazip/dev/burgerspace.html"
license=('GPL')
groups=()
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_gfx' 'sdl2_ttf')
source=("http://perso.b2b2c.ca/~sarrazip/dev/flatzebra-${pkgver}.tar.gz")
sha512sums=('d75914dd5a886d0c08407beb36370421c7cf8a375ca7df3d812f8edeac571d94b8ad2fc55a6cd8abadb14c55259d1031df585a1813c5b5e3b92ba07eb013a897')

build() {
  cd "${srcdir}/flatzebra-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/flatzebra-${pkgver}"

  make DESTDIR="$pkgdir/" install
}
