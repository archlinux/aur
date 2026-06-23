# Maintainer: Cat Kasin <cat@aulucya.gay>
# Contributer: Kevin Houdebert <kevin@qwazerty.eu>

_pkgname=pyvmomi
pkgname=python-pyvmomi
pkgver=9.1.0.0
pkgrel=1
pkgdesc="VMware vSphere API Python Bindings"
url="https://pypi.python.org/pypi/pyvmomi/"
license=('Apache')
arch=('any')
makedepends=('python-setuptools')
source=("https://github.com/vmware/pyvmomi/archive/v$pkgver.tar.gz")
sha256sums=('93a83b9d0bcb2004e9ff81f4549070462c66d9705b0a6c08795c105168e00ba5')

package() {
  depends=('python' 'python-six' 'python-requests')
  cd $srcdir/$_pkgname-$pkgver
  cat <<EOF >setup.py
from setuptools import setup

setup()
EOF
  python setup.py install --root=$pkgdir --optimize=1
}
