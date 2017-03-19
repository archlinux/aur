# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-mgmt-nspkg
pkgname=python-$_name
pkgver=1.0.0
pkgrel=1
pkgdesc="Microsoft Azure Resource Management Namespace Package [Internal]"
arch=('any')
url="https://github.com/Azure/azure-sdk-for-python"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.zip")
md5sums=('4605b225a393b34292e6fb1bdc77a92c')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
