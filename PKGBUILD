# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-cli-cloud
pkgname=python-$_name
pkgver=2.0.0
pkgrel=1
pkgdesc="Microsoft Azure Command-Line Tools Cloud Command Module"
arch=('any')
url="https://github.com/Azure/azure-cli"
license=('MIT')
depends=('python-azure-cli-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('17b6823a9d84f09d4a68e96cb202dbdf')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
