# Maintainer: Hanspeter Portner <dev at open-music-kontrollers dot ch>
_pkgname=midi_matrix.lv2
pkgname=midi-matrix-lv2
pkgver=0.18.0
pkgrel=1
pkgdesc="LV2 'Midi Matrix' plugin bundle: 'Channel Filter'"
arch=('i686' 'x86_64')
url='http://open-music-kontrollers.ch/lv2/midi_matrix'
license=('Artistic2.0')
groups=('lv2-plugins')
depends=('libxext' 'libgl')
makedepends=('cmake' 'lv2')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://github.com/OpenMusicKontrollers/$_pkgname/archive/$pkgver.tar.gz")
noextract=()
md5sums=('4faeb79ddee7f74a6eba0d96737759e4')

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
