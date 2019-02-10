# Maintainer: Petri Lehtinen <petri@digip.org>
pkgname=ultimatetapankaikki
_sprel=2
pkgver=3.21+sp${_sprel}
pkgrel=1
pkgdesc="Classic 90s shoot-em-up game"
arch=(x86_64)
url="https://github.com/suomipelit/ultimatetapankaikki"
license=('GPL')
depends=(sdl2 sdl2_image sdl2_mixer sdl2_net)
source=("https://github.com/suomipelit/ultimatetapankaikki/archive/v${_sprel}.tar.gz")
md5sums=('7d43bee578ec99e8d84ad00fcd1f0282')

build() {
  cd "$pkgname-$_sprel"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$pkgname-$_sprel"
  cd build
  make DESTDIR="$pkgdir/" install
}
