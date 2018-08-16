# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname=bp-nfoview
pkgver=0.2.5
pkgrel=1
pkgdesc="A Simple NFO-Viewer by brainpower"
arch=('i686' 'x86_64')
url="https://github.com/brainpower/bp-nfoview"
license=('GPL')
depends=('qt5-base')
makedepends=('cmake' 'git')
source=("https://github.com/brainpower/bp-nfoview/archive/v${pkgver}.tar.gz")
sha256sums=('b6f67443cafa8cccfc0fe9a172e0067b159d6ba6a4d88bc7b63f317edb702ff3')

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
