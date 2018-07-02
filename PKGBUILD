# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

pkgname=python-msrestazure
pkgver=0.4.33
pkgrel=1
pkgdesc="The runtime library \"msrestazure\" for AutoRest generated Python clients."
arch=('any')
url="https://github.com/Azure/msrestazure-for-python"
license=('MIT')
depends=('python-adal' 'python-keyring' 'python-msrest')
makedepends=('python-setuptools')
source=("https://github.com/Azure/msrestazure-for-python/archive/v${pkgver}.tar.gz")
sha256sums=('af506560bd575129a65795f974c0e08176f9443b27076815f9c24480c4ee42f0')

build() {
  cd "msrestazure-for-python-$pkgver"
  python setup.py build
}

package() {
  cd "msrestazure-for-python-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
