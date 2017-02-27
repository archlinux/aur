# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname="bp-nfoview"
pkgver=0.2.2
pkgrel=1
pkgdesc="A Simple NFO-Viewer by brainpower"
arch=('i686' 'x86_64')
url="https://github.com/brainpower/bp-nfoview"
license=('GPL')
depends=('qt5-base')
makedepends=('cmake' 'git')
source=("https://github.com/brainpower/bp-nfoview/archive/v${pkgver}.tar.gz")
sha256sums=('f1e3cfdc6c58229e1e830e3be53c23dd1ccef1d3e1c599dc32f3e5d741fb7194')

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
