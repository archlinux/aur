# Maintainer: Hanspeter Portner <dev at open-music-kontrollers dot ch>
_pkgname=zyn_ext_gui
pkgname=zyn-ext-gui-lv2
pkgver=2.5.3
pkgrel=1
pkgdesc="Toolkit agnostic LV2 UI for ZynAddSubFx"
arch=('i686' 'x86_64')
url='https://github.com/ventosus/zyn_ext_gui'
license=('Artistic2.0')
groups=('lv2-plugins')
depends=('libuv')
optsdepends=('zynaddsubfx' 'libuv')
makedepends=('cmake' 'lv2')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://github.com/ventosus/$_pkgname/archive/$pkgver.tar.gz")
noextract=()
md5sums=('daf62e38825f270a32f6490e23d37b98')

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
}

# vim:set ts=2 sw=2 et:
