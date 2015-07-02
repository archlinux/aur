# Maintainer: Christoph J. Thompson <thompsonc@protonmail.ch>

pkgname=freeblocks
pkgver=0.5
pkgrel=1
pkgdesc="Tetris Attack-like puzzle game"
arch=('i686' 'x86_64')
url="http://github.com/dorkster/freeblocks"
license=('GPL3')
depends=('sdl' 'sdl_image' 'sdl_mixer' 'sdl_ttf')
makedepends=('cmake')
source=(https://github.com/dorkster/freeblocks/archive/v${pkgver}.tar.gz)
sha256sums=(8da72ccf7bcba585fcd8b65943f590f51aff06286f3ed920a13c0c90fb392e06)

build() {
  cd "${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

