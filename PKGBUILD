# Maintainer: Dian M Fay <dian.m.fay@gmail.com>
_name=cobs
pkgname=python-cobs
pkgver=1.1.4
pkgrel=1
pkgdesc="Python library for Consistent Overhead Byte Stuffing (COBS)"
arch=("any")
url="https://pypi.python.org/pypi/$_name"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
conflicts=("${pkgname}" "${pkgname}-git")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c4fc36e3e1d3ff57670982a1b0856ca15255ab56c73c6f915ed6a45b51fa341c')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 || return 1
}
