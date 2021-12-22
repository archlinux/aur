# Maintainer: John Gerritse <tyrannis dot hawk at gmail dot com>
pkgname=python-pysubs2
_name=${pkgname#python-}
pkgver=1.3.1
pkgrel=0
pkgdesc='A Python library for editing subtitle files'
arch=(any)
url=https://pypi.org/project/pysubs2
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d964c18bf451fcd2cef65456af2e9c1880a437389e92d1c90fa727553c95418d')

build() {
  cd "${srcdir}/pysubs2-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/pysubs2-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
