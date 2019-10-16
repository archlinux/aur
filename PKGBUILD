# Maintainer: Petri Lehtinen <petri@digip.org>
pkgname=ultimatetapankaikki
_sprel=2
_commit=e8927fbbb6c135cfe5cddfb59db09199b8dc59af
pkgver=3.21+sp${_sprel}
pkgrel=2
pkgdesc="Classic 90s shoot-em-up game"
arch=(x86_64)
url="https://github.com/suomipelit/ultimatetapankaikki"
license=('GPL')
depends=(sdl2 sdl2_image sdl2_mixer sdl2_net)
source=("https://github.com/suomipelit/ultimatetapankaikki/archive/${_commit}.tar.gz")
md5sums=('032397fe1cfcb810580a4d3206bd9f78')

build() {
  cd "$pkgname-$_commit"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$pkgname-$_commit"
  cd build
  make DESTDIR="$pkgdir/" install
}
