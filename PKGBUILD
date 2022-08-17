# Maintainer: Jose Riha <jose1711 gmail com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=PyMsgBox
pkgname=python-${_base,,}
pkgver=1.0.9
pkgrel=1
pkgdesc="Simple, cross-platform, pure Python module to display message boxes, and just message boxes"
arch=(any)
url="https://github.com/asweigart/${_base}"
license=(GPL3)
depends=(python tk)
makedepends=(python-setuptools)
# checkdepends=(python-pyautogui)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('929f2998aa5c26e238977815321911309eba64c3d9cbbe2354a02f9357e66c516cfb96b147b68fadbb543cf42d2060e7f2951a51f5f9f9af6cb8ea8da38a684e')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

# check() {
#   cd ${_base}-${pkgver}
#   PYTHONPATH="${PWD}/build/lib:${PYTHONPATH}" python tests/test_pymsgbox.py
# }

package() {
  cd ${_base}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
