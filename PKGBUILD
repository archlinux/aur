# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=batrachians
pkgver=0.2.0
pkgrel=2
pkgdesc="a BurgerTime clone. "
arch=('any')
url="http://gvlsywt.cluster051.hosting.ovh.net/dev/${pkgname}.html"
license=('GPL-2.0-or-later')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_mixer' 'sdl2_gfx' 'libflatzebra')
source=("http://gvlsywt.cluster051.hosting.ovh.net/dev/${pkgname}-${pkgver}.tar.gz")
sha512sums=('da0429cd17a6c289f3d5dd1fad11847713c56510d9bdc7e6fa10e0045bb4985662030ea04e49db740eb361e8e016e701736a7ce52501816c68b32f2cd398c189')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
