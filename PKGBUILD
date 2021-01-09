# Maintainer: Samuel Recker, samuel.recker at gmail dot com
pkgname=pacminder-git
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="Configurable reminder to update pacman."
arch=('i686' 'x86_64')
url="https://github.com/samox73/pacminder"
license=('unknown')
groups=()
depends=('boost' 'boost-libs' 'libconfig')
makedepends=('git' 'cmake>=3.13')
source=(git+"https://github.com/samox73/pacminder.git")
md5sums=("SKIP")


build() {
  mkdir "$pkgname"
	cd "$pkgname"
  mkdir build && cd build
  cmake ..
	make
}

package() {
	cd "$pkgname/build"
	make DESTDIR="$pkgdir/" install
}
