# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname="bp-nfoview"
pkgver=0.2.4
pkgrel=1
pkgdesc="A Simple NFO-Viewer by brainpower"
arch=('i686' 'x86_64')
url="https://github.com/brainpower/bp-nfoview"
license=('GPL')
depends=('qt5-base')
makedepends=('cmake' 'git')
source=("https://github.com/brainpower/bp-nfoview/archive/v${pkgver}.tar.gz")
sha256sums=('edfdff839c9f23964e81be562bcee7abb27696039f64ec180fcd9f777b0c3118')

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
