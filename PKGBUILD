# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=scp
pkgname=python-$_name
pkgver=0.13.0
pkgrel=1
pkgdesc="scp module for paramiko"
arch=('any')
url="https://github.com/jbardin/scp.py"
license=('LGPL')
depends=('python-paramiko')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('a45ad81bf682491539431d70a5edbab1')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
