# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: b4283 <damispirit@gmail>

pkgname=lander
pkgver=0.6.6
pkgrel=1
pkgdesc="A Lunar Lander clone."
arch=('i686' 'x86_64')
url="http://www.doof.me.uk/lunar-lander/"
# https://github.com/nickg/lander
license=('GPL')
depends=('sdl_mixer' 'sdl_image' 'glu' 'boost-libs')
makedepends=('boost')
source=(http://www.nickg.me.uk/files/lander-$pkgver.tar.gz)
md5sums=('8ab1d2e426eb430db4641e780d16656d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # boost patch
  #sed -i 's/file_string/string/' src/Main.cpp
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
