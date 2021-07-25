# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-piwigo
_module=piwigo
pkgver=1.0.0
pkgrel=2
pkgdesc="python module for communication with Piwigo API"
url="https://github.com/fraoustin/piwigo.git"
depends=('python')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('cbef9a3fe0cbcf8ede7ac0e5f1bd2b7a26cf9f74149ced2826981fde653476e0')

build() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
