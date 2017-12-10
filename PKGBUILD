# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-multiapi-storage
pkgname=python-$_name
pkgver=0.1.7
pkgrel=1
pkgdesc="Azure Storage Data Plane SDK supporting multiple API versions"
arch=('any')
url="https://github.com/Azure/azure-multiapi-storage-python"
license=('MIT')
makedepends=('python-setuptools')
source=("https://github.com/Azure/azure-multiapi-storage-python/archive/${pkgver}.tar.gz")
md5sums=('768631a49e5c16b67a9bc9dd2f1c830c')

build() {
  cd "$_name-python-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-python-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1

  rm "$pkgdir"/usr/lib/python3.?/site-packages/azure/__init__.py
  rm "$pkgdir"/usr/lib/python3.?/site-packages/azure/__pycache__/__init__.*
}
