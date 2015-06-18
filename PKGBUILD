# Maintainer: Hanspeter Portner <dev at open-music-kontrollers dot ch>
pkgname=edje2yuv
pkgver=1.0.1
pkgrel=2
pkgdesc='A program to export Edje layout programs to video streams'
arch=('i686' 'x86_64')
url='https://github.com/ventosus/edje2yuv'
license=('Artistic2.0')
groups=()
depends=('efl' 'mjpegtools' 'ffmpeg')
makedepends=('cmake')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://github.com/ventosus/$pkgname/archive/$pkgver.tar.gz")
noextract=()
md5sums=('4feee66f5b3653250b0879cd941da3ab')

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

# vim:set ts=2 sw=2 et:
