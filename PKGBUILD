# Maintainer: Hanspeter Portner <dev at open-music-kontrollers dot ch>
_pkgname=vm.lv2
_pkgcommit=a17c7c46dd0b5446284394c6c3d2a4f189c3a9b7
pkgname=vm-lv2
pkgver=0.4.0
pkgrel=1
pkgdesc="A virtual machine LV2 plugin bundle"
arch=('i686' 'x86_64')
url='http://open-music-kontrollers.ch/lv2/vm'
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
source=("https://gitlab.com/OpenMusicKontrollers/$_pkgname/repository/archive.tar.bz2?ref=$pkgver")
noextract=()
md5sums=('fcf2745c059035eb10bb56604af96c31')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver-$_pkgcommit"
  rm -rf build
	mkdir build
}

build() {
  cd "$srcdir/$_pkgname-$pkgver-$_pkgcommit/build"

  cmake \
    -DCMAKE_BUILD_TYPE="Release" \
		-DCMAKE_INSTALL_PREFIX="/usr" \
		..
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver-$_pkgcommit/build"

  make DESTDIR="$pkgdir/" install
}

check() {
  cd "$srcdir/$_pkgname-$pkgver-$_pkgcommit/build"

  #TODO
}

# vim:set ts=2 sw=2 et:
