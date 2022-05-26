# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Javier Tia <javier dot tia at gmail dot com>

pkgname=python-stormssh
_module=stormssh
pkgver=0.7.0
pkgrel=3
pkgdesc="Management commands to ssh config files."
url="http://github.com/emre/storm"
depends=(python-paramiko python-flask python-termcolor python-six)
makedepends=(python-setuptools)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('8d034dcd9487fa0d280e0ec855d08420f51d5f9f2249f932e3c12119eaa53453')

build() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
