# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>
_base=pybrain
pkgname=python2-${_base}
pkgver=0.3.3
pkgrel=1
pkgdesc="A modular Machine Learning Library for Python"
arch=(any)
url="https://github.com/${_base}/${_base}"
license=('custom:BSD-3-clause')
depends=(python2-scipy)
makedepends=(python2-setuptools)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('d0b0401b083cf62260b65c833a12e71ac8d5d3079f24cce3eccccb7109a68493b1795b38603cf64251cc1653bec3ea00308fa6bc792d73c265d7cb4da0970ab1')

build() {
  cd ${_base}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${_base}-${pkgver}
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
