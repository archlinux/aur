# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-cli-iot
pkgname=python-$_name
pkgver=0.1.1b3
pkgrel=1
pkgdesc="Microsoft Azure Command-Line Tools IoT Command Module"
arch=('any')
url="https://github.com/Azure/azure-cli"
license=('MIT')
depends=('python-azure' 'python-azure-cli-core' 'python-pyopenssl')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('1ce7925852e995f4b7d953f6838a3389')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
