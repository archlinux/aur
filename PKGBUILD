# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname="bp-nfoview"
pkgver=0.2.1
pkgrel=1
pkgdesc="A Simple NFO-Viewer by brainpower"
arch=('i686' 'x86_64')
url="https://github.com/brainpower/bp-nfoview"
license=('GPL')
depends=('qt5-base')
makedepends=('cmake' 'git')
source=("https://github.com/brainpower/bp-nfoview/archive/v${pkgver}.tar.gz")
sha256sums=('be847091ebdf0c5c2fe90fc57833b0b40d0ce30aa88b8217c82fc0834a534ffc')

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
