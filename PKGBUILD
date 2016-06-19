# Maintainer: Hanspeter Portner <dev at open-music-kontrollers dot ch>
_pkgname=eteroj.lv2
pkgname=eteroj-lv2
pkgver=0.2.0
pkgrel=1
pkgdesc="OSC injection/ejection from/to UDP/TCP/Serial for LV2"
arch=('i686' 'x86_64')
url='http://open-music-kontrollers.ch/lv2/eteroj'
license=('Artistic2.0')
groups=('lv2-plugins')
depends=('libuv' 'sratom')
makedepends=('cmake' 'lv2')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://github.com/OpenMusicKontrollers/$_pkgname/archive/$pkgver.tar.gz")
noextract=()
md5sums=('fd59694be0d5ce4e7f4d77a4855da663')

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

  # nothing to check
}

# vim:set ts=2 sw=2 et:
