# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=python-visions
_pkgname=visions
pkgver=0.4.4
pkgrel=1
pkgdesc='Type System for Data Analysis in Python'
arch=('any')
url='https://github.com/dylan-profiler/visions'
license=('BSD')
depends=(
  python-attrs
  python-networkx
  python-numpy
  python-pandas
  python-tangled-up-in-unicode
)
makedepends=(python-setuptools)
checkdepends=(
  mypy
  python-black
  python-isort
  python-recommonmark
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/dylan-profiler/visions/archive/v${pkgver}.tar.gz")
sha512sums=('b9bec32786a5bf9d7c4e26bd6d13f03bf1bee227d697b8416f659f9b7b15f2f346b046d3b65a56988564658d187e0add9cef08368bf303400397b8aa5914a299')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
