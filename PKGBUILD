# Maintainer: Hanspeter Portner <dev at open-music-kontrollers dot ch>
pkgname=patchmatrix
_pkgcommit=4ffd9a6e1f48b6620ebd02f111183e627054fa8b
pkgver=0.10.0
pkgrel=1
pkgdesc="A JACK patch bay in flow-matrix layout"
arch=('i686' 'x86_64')
url='https://gitlab.com/OpenMusicKontrollers/patchmatrix'
license=('Artistic2.0')
groups=()
depends=('jack' 'hicolor-icon-theme' 'libxext' 'libgl')
makedepends=('cmake' 'lv2')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=()
source=("https://gitlab.com/OpenMusicKontrollers/$pkgname/repository/archive.tar.bz2?ref=$pkgver")
noextract=()
md5sums=('480123cca2306ccfe2bc9802645884b3')

prepare() {
  cd "$srcdir/$pkgname-$pkgver-$_pkgcommit"
  rm -rf build
	mkdir build
}

build() {
  cd "$srcdir/$pkgname-$pkgver-$_pkgcommit/build"

  cmake \
    -DCMAKE_BUILD_TYPE="Release" \
		-DCMAKE_INSTALL_PREFIX="/usr" \
		..
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver-$_pkgcommit/build"

  make DESTDIR="$pkgdir/" install
}

check() {
  cd "$srcdir/$pkgname-$pkgver-$_pkgcommit/build"

  #TODO
}

# vim:set ts=2 sw=2 et:
