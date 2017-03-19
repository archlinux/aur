# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-mgmt-compute
pkgname=python-$_name
pkgver=0.33.1rc1
pkgrel=1
pkgdesc="Microsoft Azure Compute Resource Management Client Library for Python"
arch=('any')
url="https://github.com/Azure/azure-sdk-for-python"
license=('MIT')
depends=('python-azure-common' 'python-azure-mgmt-nspkg' 'python-msrestazure')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.zip")
md5sums=('05057f345ff94a0ba8bb6b238df081b1')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
