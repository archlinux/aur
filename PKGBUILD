# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

pkgname=python-azure
pkgver=2.0.0rc6
pkgrel=1
pkgdesc="Microsoft Azure SDK for Python"
arch=('any')
url="https://github.com/Azure/azure-sdk-for-python"
license=('MIT')
depends=('python-azure-storage' 'python-msrestazure')
makedepends=('python-setuptools')
conflicts=('python-azure-git')
source=("https://github.com/Azure/azure-sdk-for-python/archive/v2.0.0rc6.tar.gz")
md5sums=('bc2b1084396a0dfb5f2646cec2469b64')

build() {
  cd "azure-sdk-for-python-$pkgver"
  python setup.py build
}

package() {
  cd "azure-sdk-for-python-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
