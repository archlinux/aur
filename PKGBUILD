#Maintainer: M0Rf30

pkgname=termistor-git
pkgver=43.0fe1765
pkgrel=1
pkgdesc="A drop-down terminal for Wayland"
arch=('i686' 'x86_64')
url="https://github.com/giucam/termistor"
license=('GPL3')
depends=(wayland libxkbcommon)
makedepends=('git')
source=('termistor::git+https://github.com/giucam/termistor.git')

build() {
  cd termistor
  cmake .
  make
}

package(){
  cd termistor
  make DESTDIR=$pkgdir install
}

pkgver() {
  cd termistor
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
