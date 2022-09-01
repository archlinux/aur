# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=python-pynest2d
pkgver=4.12.0
pkgrel=1
pkgdesc="Python bindings for libnest2d"
arch=(x86_64)
url="https://github.com/Ultimaker/pynest2d"
license=("LGPL")
depends=(python polyclipping nlopt)
makedepends=(sip4 cmake boost libnest2d)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Ultimaker/pynest2d/archive/${pkgver}.tar.gz)
sha512sums=('67451e3817aa308827683153c9f1fae670d95d393fad3b9b10831f7e255469df3be73fa2f90101c6dbf4034c06b51c4b3d9a4aa242f36325bb943003b0ce1842')

prepare() {
  cd pynest2d-${pkgver}

  mkdir build
}

build() {
  cd pynest2d-${pkgver}/build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd pynest2d-${pkgver}/build
  make DESTDIR="${pkgdir}" install
}
