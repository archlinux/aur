# Maintainer: Filip Gralinski <filipg@amu.edu.pl>

_name=pyminder
pkgname=python-${_name}
pkgver=1.1.1
pkgrel=1
pkgdesc="Beeminder power tools library"
arch=('any')
url="https://github.com/narthur/pyminder"
license=('MIT')
depends=('python-requests' 'python-natlibpy')
source=("https://files.pythonhosted.org/packages/45/cf/0083522f5134404ac693c62f496fc7d2e82f8d0a478729236c31b3e1b065/${_name}-${pkgver}.tar.gz")
sha256sums=('031a652d8782a23adb2be3dbe7e98741ede600a45c68b2b22d6dcc8d51425067')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"
}
