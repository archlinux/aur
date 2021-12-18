# Maintainer: pallxk <aur at pallxk dot com>

_name=azure-multiapi-storage
pkgname=python-$_name
pkgver=0.3.2
pkgrel=2
pkgdesc="Azure Storage Data Plane SDK supporting multiple API versions"
arch=('any')
url="https://github.com/Azure/azure-multiapi-storage-python"
license=('MIT')
makedepends=('python-setuptools')
source=("https://github.com/Azure/azure-multiapi-storage-python/archive/${pkgver}.tar.gz")
sha256sums=('649b8e0b2045cfdd4224bdfef387fc616b9c3e403c197dc418c9b7f76b2d0ce7')

build() {
  cd "$_name-python-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-python-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1

  rm "$pkgdir"/usr/lib/python*/site-packages/azure/__init__.py
  rm "$pkgdir"/usr/lib/python*/site-packages/azure/__pycache__/__init__.*
}
