# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-graphrbac
pkgname=python-$_name
pkgver=0.30.0rc6
pkgrel=1
pkgdesc="Microsoft Azure Graph RBAC Resource Management Client Library for Python"
arch=('any')
url="https://github.com/Azure/azure-sdk-for-python"
license=('MIT')
depends=('python-azure-common')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.zip")
md5sums=('4c372db638f0a94153672f2f632d9164')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
