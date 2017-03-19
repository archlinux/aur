# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-mgmt-authorization
pkgname=python-$_name
pkgver=0.30.0rc6
pkgrel=1
pkgdesc="Microsoft Azure Authorization Resource Management Client Library for Python"
arch=('any')
url="https://github.com/Azure/azure-sdk-for-python"
license=('MIT')
depends=('python-azure-common' 'python-azure-mgmt-nspkg')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.zip")
md5sums=('ebde9911da99e4e90161bdb018173417')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
