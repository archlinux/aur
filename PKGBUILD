# Maintainer: codingTornado <milopezv at gmail dot com>
# Maintainer: watashi <zejun dot wu at gmail dot com>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: msilvoso

pkgname=xmount
pkgver=1.3.1
pkgrel=1
pkgdesc="Tool to crossmount between multiple input and output harddisk image files"
arch=('i686' 'x86_64')
license=('GPL')
url="https://www.sits.lu"
depends=('fuse')
makedepends=('make' 'cmake' 'gcc')
options=(!makeflags)
source=(https://code.sits.lu/foss/xmount/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('080c2a715af294fe723bf7df6fdaf4a07fe0db69d876350001928af2884b9cd9')

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
