# Maintainer: fpaskali <paskali2005 at gmail>
pkgname=burgerspace
pkgver=1.9.4
pkgrel=1
pkgdesc="A hamburger-smashing video game"
arch=('any')
url="http://perso.b2b2c.ca/~sarrazip/dev/burgerspace.html"
license=('GPL')
groups=()
depends=('sdl' 'sdl_image' 'sdl_mixer' 'libflatzebra')
source=("http://perso.b2b2c.ca/~sarrazip/dev/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e4ba9b2421aa3db18ed0b99ecc23c114fe9146a248028064c5d477b99674d7d7ea4bb1de01041de1ddcc186242e346d186a155a6cdb3db28cca518349dcaa1b2')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
