# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=cosmosmash
pkgver=1.5.0
pkgrel=2
pkgdesc="an Astrosmash clone."
arch=('i686' 'x86_64')
url="http://gvlsywt.cluster051.hosting.ovh.net/dev/${pkgname}.html"
license=('GPL-2.0-or-later')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_mixer' 'sdl2_gfx' 'libflatzebra')
source=("http://perso.b2b2c.ca/~sarrazip/dev/${pkgname}-${pkgver}.tar.gz")
sha512sums=('3be4b535d68eca185d3f48ff04c11c912fdcbc17470848650b20410030c7619f9dcffaeaf3bacb3a95eb37c5944724af7fc9978613c3252af1ec725504129c23')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
