# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>
pkgname=python-msrest
pkgver=0.5.1
pkgrel=1
pkgdesc='The runtime library for AutoRest generated Python clients.'
arch=('any')
url="https://github.com/Azure/msrest-for-python"
license=('MIT')
depends=('python-isodate' 'python-requests-oauthlib')
makedepends=('python-setuptools')
source=("https://github.com/Azure/msrest-for-python/archive/v${pkgver}.tar.gz")
sha256sums=('ee7ccf05c4d3779efe96061265e9082eb69c5607fdb3339741bda8d0fc408fe5')

build() {
  cd "msrest-for-python-$pkgver"
  python setup.py build
}

package() {
  cd "msrest-for-python-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
