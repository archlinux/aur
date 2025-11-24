# Maintainer: codingTornado <milopezv at gmail dot com>
# Maintainer: watashi <zejun dot wu at gmail dot com>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: msilvoso

pkgname=xmount
pkgver=1.2.1
pkgrel=1
pkgdesc="Tool to crossmount between multiple input and output harddisk image files"
arch=('i686' 'x86_64')
license=('GPL')
url="https://www.sits.lu"
depends=('fuse')
makedepends=('make' 'cmake' 'gcc')
options=(!makeflags)
source=(https://code.sits.lu/foss/xmount/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('61b0b777ca0cd4eda30aeeeca7ec17a49d2657599a37745fb94f8dcc432b93c7')

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
