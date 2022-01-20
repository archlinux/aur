# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=python-pylibconfig2
_name=${pkgname#python-}
pkgver=0.2.5
pkgrel=2
pkgdesc="Pure python library for libconfig syntax"
arch=(any)
url="http://pypi.python.org/pypi/${_name}"
license=(GPL3)
depends=(python python-pyparsing python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('186bd2d88356036ac8770195c8a3e9bac3ccdb3b9e6ecf04be62c307760895c7')
options=(!emptydirs)

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
