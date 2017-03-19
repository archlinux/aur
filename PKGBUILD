# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-cli-core
pkgname=python-$_name
pkgver=2.0.1
pkgrel=1
pkgdesc="Microsoft Azure Command-Line Tools Core Module"
arch=('any')
url="https://github.com/Azure/azure-cli"
license=('MIT')
depends=('python-adal' 'python-argcomplete>=1.8.0' 'python-azure-cli-nspkg' 'python-colorama'
         'python-jmespath' 'python-msrestazure' 'python-requests' 'python-six' 'python-tabulate'
         'python-yaml')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('216dea1e6cea183641409c5292544798')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
