# Previous maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Maintainer: fenuks

pkgname=gemrb
pkgver=0.9.2
pkgrel=1
pkgdesc="OSS implementation of Bioware's Infinity Engine which supports eg. Baldur's Gate"
arch=('x86_64')
url="https://www.gemrb.org/"
license=('GPL')
depends=('python' 'sdl2' 'sdl2_mixer' 'openal' 'hicolor-icon-theme' 'libpng' 'freetype2')
makedepends=('cmake')
install=gemrb.install
source=("https://github.com/gemrb/gemrb/archive/v${pkgver}.tar.gz")
sha1sums=('a7d4cbec3ce2f02a91cb78bde3ff3e32cad2be30')

build() {
  mkdir -p build
  cd build

  cmake ../${pkgname}-${pkgver} -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

