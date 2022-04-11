# Maintainer: John Gerritse <tyrannis dot hawk at gmail dot com>
pkgname=python-pysubs2
_name=${pkgname#python-}
pkgver=1.4.2
pkgrel=0
pkgdesc='A Python library for editing subtitle files'
arch=(any)
url=https://pypi.org/project/pysubs2
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ffc49b40f4d6867eced2b8cf51b074004c03a419fa460655b779574a792c5fa0')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
