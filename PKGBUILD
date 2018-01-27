# Maintainer: Hanspeter Portner <dev at open-music-kontrollers dot ch>
_pkgname=vm.lv2
pkgname=vm-lv2
pkgver=0.4.0
pkgrel=2
pkgdesc="A virtual machine LV2 plugin bundle"
arch=('i686' 'x86_64')
url='http://open-music-kontrollers.ch/lv2/vm/'
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
source=("https://git.open-music-kontrollers.ch/lv2//$_pkgname/snapshot/$_pkgname-$pkgver.tar.xz")
noextract=()
sha256sums=('207379efad6af3a5e3fdb6e81455ab1ee54554f8f420e67f521ffff883c2152d')

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
