# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=quadrupleback
pkgver=0.2.0
pkgrel=1
pkgdesc="It is a clone of the 1982 Doubleback game"
arch=('i686' 'x86_64')
url="http://perso.b2b2c.ca/~sarrazip/dev/${pkgname}.html"
license=('GPL-2.0-or-later')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_mixer' 'sdl2_gfx' 'libflatzebra')
source=("http://perso.b2b2c.ca/~sarrazip/dev/${pkgname}-${pkgver}.tar.gz")
sha512sums=('9319ad10891d517956d4320e8b76d1e79dee48754a0d7b95e714bc2e6daaff376fd4f7848288e54443620a8f324b6577e894c039dfe54f98ac7849f8cafed997')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
