# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname="bp-nfoview"
pkgver=0.2.0
pkgrel=1
pkgdesc="A Simple NFO-Viewer by brainpower"
arch=('i686' 'x86_64')
url="https://github.com/brainpower/bp-nfoview"
license=('GPL')
depends=('qt5-base')
makedepends=('cmake' 'git')
source=("https://github.com/brainpower/bp-nfoview/archive/v${pkgver}.tar.gz")
sha256sums=('5deae6e200443fbca2ed3859ebdb722baca1c31d0e52add78b945a8e971da0f8')

build(){
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir -p build/
  cd build/

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make ${MAKEFLAGS}
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}/build/"
	make DESTDIR="${pkgdir}" install
}
