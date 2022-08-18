# Maintainer: Sebastien MacDougall-Landry

pkgname=tidalpp
pkgver=0.1
pkgrel=1
pkgdesc='Simple game engine'
url='https://github.com/EmperorPenguin18/tidalpp/'
source=("https://github.com/EmperorPenguin18/$pkgname/archive/$pkgver.tar.gz")
arch=('x86_64')
license=('LGPL3')
depends=('sdl2' 'physfs' 'cjson' 'sdl2_ttf' 'chipmunk' 'sdl2_mixer')
sha256sums=('14d92bb09c04c0bef9e9028244e70272e6d39cba764402b4e5981d83c5898f87')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  g++ -O3 -l SDL2 -l physfs -l cjson -l SDL2_ttf -l chipmunk -l SDL2_mixer src/*.cc -o tidalpp
}

package () {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 tidalpp -t "$pkgdir/usr/bin"
}
