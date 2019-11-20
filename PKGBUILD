# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=libcelero-headers
_pkgname=Celero
pkgver=2.6.0
pkgrel=1
pkgdesc='C++ Benchmark Authoring Library/Framework (Developmental Headers)'
arch=('any')
url='https://github.com/DigitalInBlue/Celero'
license=('custom:"Apache License, Version 2.0"')
conflicts=('libcelero')
provides=('libcelero')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/DigitalInBlue/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a5b72da254f81d42369382ba3157229b6b32ebbb670a22b185f80db95535e66e')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "include/celero/"
  mkdir -p "${pkgdir}/usr/include/celero/"
  install -Dm644 *.h "${pkgdir}/usr/include/celero/"
}
