# Maintainer: Petri Lehtinen <petri@digip.org>
pkgname=triplane
_sprel=2
_commit=aeff31106f94a31550f33daa41104e0681eee626
pkgver=1.08+sp${_sprel}
pkgrel=1
pkgdesc="Classic side-scrolling dogfighting game featuring solo missions and multiplayer mode"
arch=(x86_64)
url="https://github.com/suomipelit/triplane"
license=('GPL')
depends=(sdl2 sdl2_mixer)
source=("https://github.com/suomipelit/triplane/archive/${_commit}.tar.gz")
md5sums=('27bdb6493311695552988b571fc2e786')

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
