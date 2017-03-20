# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-cli-resource
pkgname=python-$_name
pkgver=2.0.1
pkgrel=1
pkgdesc="Microsoft Azure Command-Line Tools Resource Command Module"
arch=('any')
url="https://github.com/Azure/azure-cli"
license=('MIT')
depends=('python-azure' 'python-azure-cli-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('831c694dea6035f3cf42aa1cfbc9359d')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
