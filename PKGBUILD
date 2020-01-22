# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: b4283 <damispirit@gmail>

pkgname=lander
pkgver=0.7.2
pkgrel=1
pkgdesc="A Lunar Lander clone."
arch=('i686' 'x86_64')
url="http://www.doof.me.uk/lunar-lander/"
# https://github.com/nickg/lander
license=('GPL')
depends=('sdl_mixer' 'sdl_image' 'glu' 'boost-libs')
makedepends=('boost' 'meson' 'ninja')
source=(http://www.nickg.me.uk/files/lander-$pkgver.tar.xz)
md5sums=('f311d1762d5665e70003fd1375bfb582')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
  cd build
  meson --prefix=/usr ../
  ninja
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  DESTDIR="$pkgdir" ninja install
}
