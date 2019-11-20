# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=libcelero
_pkgname=Celero
pkgver=2.6.0
pkgrel=1
pkgdesc='C++ Benchmark Authoring Library/Framework'
arch=('x86_64' 'i686')
url='https://github.com/DigitalInBlue/Celero'
license=('custom:"Apache License, Version 2.0"')
depends=('gcc-libs')
makedepends=('cmake')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/DigitalInBlue/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a5b72da254f81d42369382ba3157229b6b32ebbb670a22b185f80db95535e66e')

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
