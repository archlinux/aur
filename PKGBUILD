# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=python-pydvdid
_module=pydvdid
pkgver=1.1
pkgrel=3
pkgdesc="A pure Python implementation of the Windows API IDvdInfo2::GetDiscID method, as used by Windows Media Center to compute a 'practically unique' 64-bit CRC for metadata retrieval."
url="https://github.com/sjwood/pydvdid"
depends=(python)
makedepends=(python-setuptools)
license=(Apache)
arch=(any)
source=("https://files.pythonhosted.org/packages/source/p/pydvdid/pydvdid-${pkgver}.tar.gz")
sha256sums=('a3494f2bdab325de1e1f3441af134f8c3c287c0aa3a54d4acbfa857900e9d8d9')

build() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
