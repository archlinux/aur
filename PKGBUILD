# Maintainer: Samuel Recker, samuel.recker at gmail dot com
pkgname=pacminder
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="Configurable reminder to update pacman."
arch=('i686' 'x86_64')
url="https://github.com/samox73/pacminder"
license=('unknown')
groups=()
# depends=('boost' 'boost-libs' 'libconfig')
# makedepends=('git' 'cmake>=3.13')
depends=('boost-libs' 'libconfig')
makedepends=('git')
source=(git+"https://github.com/samox73/pacminder.git")
# checkdepends=()
# optdepends=()
# provides=()
# conflicts=()
# replaces=()
# backup=()
# options=()
# install=
# changelog=
# noextract=()
md5sums=("SKIP")
# validpgpkeys=()


build() {
  # cd "${srcdir}" executed implicitly before build()
	# cd "$pkgname-$pkgver"
	cd "$pkgname"
  mkdir build && cd build
  cmake ..
	make
}

package() {
	# cd "$pkgname-$pkgver/build"
	cd "$pkgname/build"
  rm /usr/
	make DESTDIR="$pkgdir/" install
}
