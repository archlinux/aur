# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

pkgname=python-azure
pkgver=3.0.0
pkgrel=1
pkgdesc="Microsoft Azure SDK for Python"
arch=('any')
url="https://github.com/Azure/azure-sdk-for-python"
license=('MIT')
depends=('python-azure-storage' 'python-msrestazure')
makedepends=('python-setuptools')
conflicts=('python-azure-git')
source=("https://github.com/Azure/azure-sdk-for-python/archive/azure_${pkgver}.tar.gz")
md5sums=('6fc80614be49e9c9447c24be894c69e1')

build() {
  cd "azure-sdk-for-python-azure_$pkgver"
  python setup.py build
}

package() {
  cd "azure-sdk-for-python-azure_$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
