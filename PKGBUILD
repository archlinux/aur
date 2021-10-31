# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=dmtx-utils
pkgver=0.7.6
pkgrel=1
pkgdesc="Utilities to libdmtx"
url="http://www.libdmtx.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('libdmtx' 'imagemagick')
source=("https://github.com/dmtx/dmtx-utils/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

sha256sums=('0d396ec14f32a8cf9e08369a4122a16aa2e5fa1675e02218f16f1ab777ea2a28')
