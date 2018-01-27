# Maintainer: Hanspeter Portner <dev at open-music-kontrollers dot ch>
_pkgname=sherlock.lv2
pkgname=sherlock-lv2
pkgver=0.14.0
pkgrel=2
pkgdesc="An investigative LV2 plugin bundle"
arch=('i686' 'x86_64')
url='http://open-music-kontrollers.ch/lv2/sherlock/'
license=('Artistic2.0')
groups=('lv2-plugins')
depends=('libgl' 'sratom')
makedepends=('cmake' 'lv2' 'flex')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://git.open-music-kontrollers.ch/lv2/$_pkgname/snapshot/$_pkgname-$pkgver.tar.xz")
noextract=()
sha256sums=('cc0b4bae1b575b4c019732f3cadeda4a8398c5d1ad0d7f4e9327fc2d076ef7ef')

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

check() {
  cd "$srcdir/$_pkgname-$pkgver/build"

  #TODO
}

# vim:set ts=2 sw=2 et:
