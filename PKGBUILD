# Maintainer: John Gerritse <tyrannis dot hawk at gmail dot com>
pkgname=python-pysubs2
_name=${pkgname#python-}
pkgver=1.3.0
pkgrel=0
pkgdesc='A Python library for editing subtitle files'
arch=(any)
url=https://pypi.org/project/pysubs2
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('15f8f283fdba448408bfbc95e7ff14091ce3a6ce1d32dc43dcb5ab34638124ae')

build() {
  cd "${srcdir}/pysubs2-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/pysubs2-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
