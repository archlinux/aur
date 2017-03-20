# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-cli-configure
pkgname=python-$_name
pkgver=2.0.1
pkgrel=1
pkgdesc="Microsoft Azure Command-Line Tools Configure Command Module"
arch=('any')
url="https://github.com/Azure/azure-cli"
license=('MIT')
depends=('python-azure-cli-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('e444323eb0b1f1d8b49646a4c6a6e777')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
