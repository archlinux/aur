# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Tobias Baust <tobias.baust at tutanota dot com>
_base=PyFoam
pkgname=python-${_base,,}
pkgver=2023.7
pkgrel=1
pkgdesc="Python Utilities for OpenFOAM"
arch=(any)
url="http://openfoamwiki.net/index.php/Contrib/${_base}"
license=(GPL-2.0-or-later)
depends=(python-numpy python-jinja)
makedepends=(python-installer)
source=(https://pypi.org/packages/py2.py3/${_base::1}/${_base}/${_base}-${pkgver}-py2.py3-none-any.whl)
sha512sums=('33016d7552395566793100c50cdc03d23412f991e14f77d80587a5e4c32d227ce1f9328db7f6f75a7af3b966a39ad21ab2fcdbaaf6911b5e8275f5d2685b3960')

package() {
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" ${_base//-/_}-${pkgver}-py2.py3-none-any.whl
}
