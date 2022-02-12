# Maintainer: Lukas Zimmermann <luk.zim91 at gmail dot com>
# Contributor: Kelsey Maes <kelseymaes at outlook dot com>

_name=scp
pkgname=python-$_name
pkgver=0.14.2
pkgrel=1
pkgdesc="scp module for paramiko"
arch=('any')
url="https://github.com/jbardin/scp.py"
license=('LGPL')
depends=('python-paramiko')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('713f117413bbd616a1a7da8f07db9adcd835ce73d8585fb469ea5b5785f92e4d')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

