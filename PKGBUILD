# Maintainer: Dian M Fay <dian.m.fay@gmail.com>
_name=cobs
pkgname=python-cobs
pkgver=1.1.3
pkgrel=1
pkgdesc="Python library for Consistent Overhead Byte Stuffing (COBS)"
arch=("any")
url="https://pypi.python.org/pypi/$_name"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
conflicts=("${pkgname}" "${pkgname}-git")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("ae3319b5704d9269d1ca60787d2e5b79322bb9f440215ea086b986ed8d2a8405")

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 || return 1
}
