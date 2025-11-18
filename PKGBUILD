# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sven Hesse <drmccoy@drmccoy.de>

pkgname=xoreos
pkgver=0.0.6
pkgrel=1
pkgdesc="A reimplementation of BioWare's Aurora engine"
arch=(x86_64)
url="https://github.com/xoreos/xoreos"
license=(GPL-3.0-or-later)
depends=(zlib xz libxml2 boost-libs sdl2 freetype2 openal libmad libvorbis faad2 xvidcore libvpx) #libogg
makedepends=(git boost)
source=("git+https://github.com/xoreos/xoreos.git#tag=v${pkgver}")
sha256sums=('5b0a0fab5d568ba2c39c640cf45d42ddc6b9acac4cca07e1fa5dd3d8e01ce01d')

prepare() {
  cd xoreos
  ./autogen.sh
}

build() {
  cd xoreos
  ./configure --with-release=AUR --with-lto --prefix=/usr
  make
}

package() {
  cd xoreos
  make DESTDIR="$pkgdir/" install
}
