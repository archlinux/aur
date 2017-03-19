# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-cli
pkgname=python-$_name
pkgver=2.0.1
pkgrel=1
pkgdesc="Microsoft Azure Command-Line Tools"
arch=('any')
url="https://github.com/Azure/azure-cli"
license=('MIT')
depends=('python-azure-cli-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('f1eb3c2a9f6ac008d2741c6e37b066c4')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
