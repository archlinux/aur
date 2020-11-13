# Maintainer: Petri Lehtinen <petri@digip.org>
pkgname=ultimatetapankaikki
_sprel=3
_commit=56ec1f224ed78a6db59f38f0ad4b5a224bfc7fda
pkgver=3.21+sp${_sprel}
pkgrel=1
pkgdesc="Classic 90s shoot-em-up game"
arch=(x86_64)
url="https://github.com/suomipelit/ultimatetapankaikki"
license=('GPL')
depends=(sdl2 sdl2_image sdl2_mixer sdl2_net)
source=("https://github.com/suomipelit/ultimatetapankaikki/archive/${_commit}.tar.gz")
md5sums=('d5103208e827930aa7dc530f0c95752d')

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
