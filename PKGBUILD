# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-cli-container
pkgname=python-$_name
pkgver=0.1.1b4
pkgrel=1
pkgdesc="Microsoft Azure Command-Line Tools container Command Module"
arch=('any')
url="https://github.com/Azure/azure-cli"
license=('MIT')
depends=('python-azure-cli-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('c79d4a37228dc14b6f630d3a239e950e')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
