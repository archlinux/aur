# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=libcelero
_pkgname=Celero
pkgver=2.3.0
pkgrel=2
pkgdesc='C++ Benchmark Authoring Library/Framework'
arch=('x86_64' 'i686')
url='https://github.com/DigitalInBlue/Celero'
license=('custom:"Apache License, Version 2.0"')
depends=('gcc-libs')
makedepends=('cmake')
source=("https://github.com/DigitalInBlue/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5f8c7121f90856fc69669124697849ba262cef5a1876902fe65542e180945960')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd build
  make DESTDIR="${pkgdir}" install
}
