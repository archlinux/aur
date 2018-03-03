# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

pkgname=python-msrestazure
pkgver=0.4.22
pkgrel=1
pkgdesc="The runtime library \"msrestazure\" for AutoRest generated Python clients."
arch=('any')
url="https://github.com/Azure/msrestazure-for-python"
license=('MIT')
depends=('python-adal' 'python-keyring' 'python-msrest')
makedepends=('python-setuptools')
source=("https://github.com/Azure/msrestazure-for-python/archive/v${pkgver}.tar.gz")
md5sums=('8c261f80a115940af63422eb6baca268')

build() {
  cd "msrestazure-for-python-$pkgver"
  python setup.py build
}

package() {
  cd "msrestazure-for-python-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
