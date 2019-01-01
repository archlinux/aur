# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-multiapi-storage
pkgname=python-$_name
pkgver=0.2.2
pkgrel=1
pkgdesc="Azure Storage Data Plane SDK supporting multiple API versions"
arch=('any')
url="https://github.com/Azure/azure-multiapi-storage-python"
license=('MIT')
makedepends=('python-setuptools')
source=("https://github.com/Azure/azure-multiapi-storage-python/archive/${pkgver}.tar.gz")
sha256sums=('c75687a3de550ba01fdae4113cee747778275316d7c87b5ae3e8c5d5a1b37e80')

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
