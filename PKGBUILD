# Maintainer: Hugo Hörnquist <hugo@lysator.liu.se>
# Contributor: houkime <houkime at protonmail.com>

pkgname=guile-sdl2
pkgver=0.8.0
pkgrel=1
pkgdesc='Guile Scheme bindings for SDL2'
arch=(any)
license=(LGPL3)
depends=('guile>=2.1.4' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer')
url=https://dthompson.us/projects/guile-sdl2.html
source=("https://files.dthompson.us/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.asc})
md5sums=('be34cc9b0b82211dd88e0dd5aaf03dbb'
         'SKIP')
validpgpkeys=( 8CCBA7F552B9CBEAE1FB29158328C7470FF1D807 )
options=(!strip)

build(){
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}
