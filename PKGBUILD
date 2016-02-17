# Maintainer: Hanspeter Portner <dev at open-music-kontrollers dot ch>
_pkgname=zyn_ext_gui
_pkgsubver=1
pkgname=zyn-ext-gui-lv2
pkgver=2.5.3
pkgrel=2
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
source=("https://github.com/ventosus/$_pkgname/archive/$pkgver-$_pkgsubver.tar.gz")
noextract=()
md5sums=('b3f471e733fa6798c2afe5f2a3f5c21f')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver-$_pkgsubver"
  rm -rf build
	mkdir build
}

build() {
  cd "$srcdir/$_pkgname-$pkgver-$_pkgsubver/build"

  cmake \
    -DCMAKE_BUILD_TYPE="Release" \
		-DCMAKE_INSTALL_PREFIX="/usr" \
		..
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver-$_pkgsubver/build"

  make DESTDIR="$pkgdir/" install
}

check() {
  cd "$srcdir/$_pkgname-$pkgver-$_pkgsubver/build"
}

# vim:set ts=2 sw=2 et:
