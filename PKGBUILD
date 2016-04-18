# Maintainer: Hanspeter Portner <dev at open-music-kontrollers dot ch>
pkgname=patchmatrix
pkgver=0.2.1
pkgrel=1
pkgdesc="A JACK patch bay in matrix layout"
arch=('i686' 'x86_64')
url='https://github.com/OpenMusicKontrollers/patchmatrix'
license=('Artistic2.0')
groups=()
depends=('elementary' 'jack' 'sqlite' 'hicolor-icon-theme')
makedepends=('cmake' 'lv2')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=patchmatrix.install
source=("https://github.com/OpenMusicKontrollers/$pkgname/archive/$pkgver.tar.gz")
noextract=()
md5sums=('d513ab0a5ab0ceee8d3add65e9875699')

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
