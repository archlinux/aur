# Maintainer: Hugo Hörnquist <hugo@lysator.liu.se>
# Contributor: houkime <houkime at protonmail.com>

pkgname=guile-sdl2
pkgver=0.7.0
pkgrel=1
pkgdesc='Guile Scheme bindings for SDL2'
arch=(any)
license=(LGPL3)
depends=('guile>=2.1.4' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer')
url=https://dthompson.us/projects/guile-sdl2.html
source=("https://files.dthompson.us/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.asc})
md5sums=('65e8197638f03e0ab7765e3d2b1d380a'
         'SKIP')

build(){
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}
