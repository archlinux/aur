# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-cli-component
pkgname=python-$_name
pkgver=2.0.0
pkgrel=1
pkgdesc="Microsoft Azure Command-Line Tools Component Command Module"
arch=('any')
url="https://github.com/Azure/azure-cli"
license=('MIT')
depends=('python-azure-cli-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('70f11f2d846f4f9e0de4b8a884a50c88')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
