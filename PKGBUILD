# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-cli-redis
pkgname=python-$_name
pkgver=0.1.1b3
pkgrel=1
pkgdesc="Microsoft Azure Command-Line Tools Redis Command Module"
arch=('any')
url="https://github.com/Azure/azure-cli"
license=('MIT')
depends=('python-azure' 'python-azure-cli-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('2b621d453059d70c8d2c5f0fb5ff1357')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
