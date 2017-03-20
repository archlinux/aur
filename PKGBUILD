# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-cli-appservice
pkgname=python-$_name
pkgver=0.1.1b6
pkgrel=1
pkgdesc="Microsoft Azure Command-Line Tools AppService Command Module"
arch=('any')
url="https://github.com/Azure/azure-cli"
license=('MIT')
depends=('python-azure' 'python-azure-cli-core' 'python-pyopenssl')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('43390c25d6db3ebc0865a898f383071e')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
