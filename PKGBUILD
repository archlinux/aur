# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-storage
pkgname=python2-$_name
pkgver=0.34.0
pkgrel=1
pkgdesc="Microsoft Azure Storage Client Library for Python"
arch=('any')
url="https://github.com/Azure/azure-storage-python"
license=('Apache')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.zip")
md5sums=('6342a92b968cf350193e460a6329f3f0')

build() {
  cd "$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
