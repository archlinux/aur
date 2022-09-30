# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

# shellcheck disable=SC2034
_name="packaging"
_pkgbase="python-${_name}"
pkgbase="python2-${_name}"
pkgname=("${pkgbase}")
pkgver=20.9
pkgrel=7
pkgdesc="Core utilities for Python packages"
arch=('any')
url="https://github.com/pypa/${_name}"
license=('Apache')
makedepends=('python2-setuptools' 'python2-pyparsing')
checkdepends=('python2-pytest' 'python-pretend')
source=("https://github.com/pypa/${_name}/archive/${pkgver}/${_pkgbase}-${pkgver}.tar.gz")
sha512sums=('fb71f1036cfaacbe94fdee663af31d6ad1960f73ecc95cba87b461c2d7d2ea90085853bb4682b146492d8c48f784b60ef082e3b1259269857166b143cd9a920b')

build() {
  cd "${_name}-${pkgver}" || exit
  python2 setup.py build
}

# shellcheck disable=SC2154
package() {
  depends=('python2-pyparsing' 'python2-six')

  cd "${_name}-${pkgver}" || exit
  python2 setup.py install --root "${pkgdir}"
}

