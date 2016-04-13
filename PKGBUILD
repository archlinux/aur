# Maintainer: Hanspeter Portner <dev at open-music-kontrollers dot ch>
_pkgname=sherlock.lv2
pkgname=sherlock-lv2
pkgver=0.1.2
pkgrel=2
pkgdesc="An investigative LV2 plugin bundle"
arch=('i686' 'x86_64')
url='http://open-music-kontrollers.ch/lv2/sherlock'
license=('Artistic2.0')
groups=('lv2-plugins')
depends=('elementary' 'lilv' 'sratom' 'nanomsg')
makedepends=('cmake' 'lv2' 'flex')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://github.com/OpenMusicKontrollers/$_pkgname/archive/$pkgver.tar.gz")
noextract=()
md5sums=('8cba02b6243aa8ee169f7b723558e125')

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
