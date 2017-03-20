# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-cli-find
pkgname=python-$_name
pkgver=0.0.1b1
pkgrel=1
pkgdesc="Microsoft Azure Command-Line Tools Find Command Module"
arch=('any')
url="https://github.com/Azure/azure-cli"
license=('MIT')
depends=('python-azure-cli-core' 'python-whoosh')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('825c34507615738f44af59d99fcca12d')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
