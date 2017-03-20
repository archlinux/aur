# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-cli-role
pkgname=python-$_name
pkgver=2.0.0
pkgrel=1
pkgdesc="Microsoft Azure Command-Line Tools Role Command Module"
arch=('any')
url="https://github.com/Azure/azure-cli"
license=('MIT')
depends=('python-azure' 'python-azure-cli-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('9710304492cb739c1f0c65befc4689f4')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
