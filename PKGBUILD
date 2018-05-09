# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=hashit
pkgver=0.1.11
pkgrel=1
pkgdesc="Checksum tool for Pantheon"
arch=('x86_64')
url='https://artemanufrij.github.io/'
license=('GPL3')
depends=('libgranite.so' 'gtk3')
makedepends=('vala' 'cmake' 'cmake-modules-elementary-git')
source=("https://github.com/artemanufrij/hashit/archive/${pkgver}.tar.gz")
sha256sums=('f4d550f1e14a283a9078a9358fbd9175a38a5521a567dbe5535f5198adfe2cc4')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -d build
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  make DESTDIR="${pkgdir}" install
}
