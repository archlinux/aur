# Maintainer: Cat Kasin <cat@aulucya.gay>
# Contributer: Kevin Houdebert <kevin@qwazerty.eu>

_pkgname=pyvmomi
pkgname=python-pyvmomi
pkgver=9.0.0.0
pkgrel=1
pkgdesc="VMware vSphere API Python Bindings"
url="https://pypi.python.org/pypi/pyvmomi/"
license=('Apache')
arch=('any')
makedepends=('python-setuptools')
source=("https://github.com/vmware/pyvmomi/archive/v$pkgver.tar.gz")
sha256sums=('eeed490ca13b7bdc055d6c514d3a905aba6a10cf2749a8fb514790e7d515d3ee')

package() {
  depends=('python' 'python-six' 'python-requests')
  cd $srcdir/$_pkgname-$pkgver
  cat <<EOF >setup.py
from setuptools import setup

setup()
EOF
  python setup.py install --root=$pkgdir --optimize=1
}
