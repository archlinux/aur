# Maintainer: Hanspeter Portner <dev at open-music-kontrollers dot ch>
pkgname=patchmatrix
pkgver=0.12.0
pkgrel=2
pkgdesc="A JACK patch bay in flow-matrix layout"
arch=('i686' 'x86_64')
url='https://git.open-music-kontrollers.ch/lad/patchmatrix/'
license=('Artistic2.0')
groups=()
depends=('jack' 'hicolor-icon-theme' 'libgl')
makedepends=('cmake' 'lv2')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=()
source=("https://git.open-music-kontrollers.ch/lad/$pkgname/snapshot/$pkgname-$pkgver.tar.xz")
noextract=()
sha256sums=('e5dcccc5d1d170d19a292d1ece814c097109c0f0c7c45364d35e81237f469ca7')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  rm -rf build
	mkdir build
}

build() {
  cd "$srcdir/$pkgname-$pkgver/build"

  cmake \
    -DCMAKE_BUILD_TYPE="Release" \
		-DCMAKE_INSTALL_PREFIX="/usr" \
		..
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"

  make DESTDIR="$pkgdir/" install
}

check() {
  cd "$srcdir/$pkgname-$pkgver/build"

  #TODO
}

# vim:set ts=2 sw=2 et:
