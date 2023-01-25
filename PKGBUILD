# Maintainer: fpaskali <paskali2005 at gmail>
pkgname=burgerspace
pkgver=1.9.5
pkgrel=1
pkgdesc="A hamburger-smashing video game"
arch=('any')
url="http://perso.b2b2c.ca/~sarrazip/dev/burgerspace.html"
license=('GPL')
groups=()
depends=('sdl' 'sdl_image' 'sdl_mixer' 'libflatzebra')
source=("http://perso.b2b2c.ca/~sarrazip/dev/${pkgname}-${pkgver}.tar.gz")
sha512sums=('f7a1fbf516ba5a310def22381bfc4ac4297f92895296a146f4306e7b2cde21186b349d6c22abf622776a06f992a2af02b332483432002a9b04ab8e1a62655434')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
