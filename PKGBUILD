# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-cli-sql
pkgname=python-$_name
pkgver=0.1.1b6
pkgrel=1
pkgdesc="Microsoft Azure Command-Line Tools SQL Command Module"
arch=('any')
url="https://github.com/Azure/azure-cli"
license=('MIT')
depends=('python-azure' 'python-azure-cli-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('b0a40ae977d9b35b5c4ce4a8853310fc')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
