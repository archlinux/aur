# Maintainer: Hanspeter Portner <dev at open-music-kontrollers dot ch>
_pkgname=zyn_ext_gui
_pkgver=0.6.0
pkgname=zyn-ext-gui-lv2
pkgver=4.$_pkgver
pkgrel=1
pkgdesc="Toolkit agnostic LV2 UI for ZynAddSubFx"
arch=('i686' 'x86_64')
url='https://github.com/ventosus/zyn_ext_gui'
license=('Artistic2.0')
groups=('lv2-plugins')
depends=('glibc')
optsdepends=('zynaddsubfx')
makedepends=('cmake' 'lv2')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://github.com/ventosus/$_pkgname/archive/$_pkgver.tar.gz")
noextract=()
md5sums=('32d1455fe20a4fca22bc5e53119e2452')

prepare() {
  cd "$srcdir/$_pkgname-$_pkgver"
  rm -rf build
	mkdir build
}

build() {
  cd "$srcdir/$_pkgname-$_pkgver/build"

  cmake \
    -DCMAKE_BUILD_TYPE="Release" \
		-DCMAKE_INSTALL_PREFIX="/usr" \
		..
  make
}

package() {
  cd "$srcdir/$_pkgname-$_pkgver/build"

  make DESTDIR="$pkgdir/" install
}

check() {
  cd "$srcdir/$_pkgname-$_pkgver/build"
}

# vim:set ts=2 sw=2 et:
