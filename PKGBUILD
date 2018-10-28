# Maintainer: codingTornado <milopezv at gmail dot com>
# Maintainer: watashi <zejun dot wu at gmail dot com>
# Contributor: kfgz <kfgz at interia pl>

pkgname=xmount
pkgver=0.7.6
pkgrel=1
pkgdesc="Tool to crossmount between multiple input and output harddisk image files"
arch=('i686' 'x86_64')
license=('GPL')
url="https://www.pinguin.lu"
depends=('fuse' 'libewf' 'afflib')
makedepends=('cmake')
options=(!makeflags)
source=(http://files.pinguin.lu/${pkgname}-${pkgver}.tar.gz)
sha256sums=('76e544cd55edc2dae32c42a38a04e11336f4985e1d59cec9dd41e9f9af9b0008')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}/build
  make DESTDIR="${pkgdir}" install
}
