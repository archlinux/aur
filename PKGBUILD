# Maintainer: pallxk <aur at pallxk dot com>

pkgname=python-azure-git
pkgver=latest
pkgrel=2
pkgdesc="Microsoft Azure SDK for Python"
arch=('any')
url="https://github.com/Azure/azure-sdk-for-python"
license=('MIT')
depends=('python-azure-storage' 'python-msrestazure')
makedepends=('git' 'python-setuptools')
provides=('python-azure')
conflicts=('python-azure')
source=("git+https://github.com/Azure/azure-sdk-for-python.git")
md5sums=('SKIP')

build() {
  cd azure-sdk-for-python
  python setup.py build
}

package() {
  cd azure-sdk-for-python
  python setup.py install --root="$pkgdir" --optimize=1
}
