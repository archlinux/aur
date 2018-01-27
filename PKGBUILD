# Maintainer: Hanspeter Portner <dev at open-music-kontrollers dot ch>
_pkgname=midi_matrix.lv2
pkgname=midi-matrix-lv2
pkgver=0.20.0
pkgrel=2
pkgdesc="LV2 'Midi Matrix' plugin bundle: 'Channel Filter'"
arch=('i686' 'x86_64')
url='http://open-music-kontrollers.ch/lv2/midi_matrix/'
license=('Artistic2.0')
groups=('lv2-plugins')
depends=('libgl')
makedepends=('cmake' 'lv2')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://git.open-music-kontrollers.ch/lv2/$_pkgname/snapshot/$_pkgname-$pkgver.tar.xz")
noextract=()
sha256sums=('884099e426275b8e7e9b4ec62d00bcb59f52faf4ef0a955305a792f032bc9c49')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  rm -rf build
	mkdir build
}

build() {
  cd "$srcdir/$_pkgname-$pkgver/build"

  cmake \
    -DCMAKE_BUILD_TYPE="Release" \
		-DCMAKE_INSTALL_PREFIX="/usr" \
		..
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/build"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
