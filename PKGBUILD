# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-cli-command-modules-nspkg
pkgname=python-$_name
pkgver=2.0.0
pkgrel=1
pkgdesc="Microsoft Azure CLI Command Modules Namespace Package"
arch=('any')
url="https://github.com/Azure/azure-cli"
license=('MIT')
depends=('python-azure-cli-nspkg')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('23ab9ea1c262182f1c01141dce253b15')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
