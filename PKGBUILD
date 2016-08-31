# Maintainer:  WorMzy Tykashi <wormzy.tykashi@gmail.com>
pkgname=freeserf-git
pkgver=0.2_rc1_217_gfc492f4
pkgrel=1
pkgdesc="Opensource Settlers 1 clone (requires original game file)"
arch=('i686' 'x86_64')
url="http://jonls.dk/freeserf/"
license=('GPL3')
depends=('sdl2' 'sdl2_mixer')
makedepends=('git' 'autoconf-archive')
install=freeserf.install
source=(git+"https://github.com/freeserf/freeserf.git")
md5sums=('SKIP')

pkgver() {
  cd freeserf
  git describe --tags | sed -e 's:^v::' -e 's:-:_:g'
}

prepare() {
  cd freeserf
  ./bootstrap
}
  
build() {
  cd freeserf
  ./configure --prefix="/usr"
  make
}

package() {
  cd freeserf
  make DESTDIR="$pkgdir" install
}
