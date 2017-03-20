# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-cli-nspkg
pkgname=python-$_name
pkgver=2.0.0
pkgrel=2
pkgdesc="Microsoft Azure CLI Namespace Package"
arch=('any')
url="https://github.com/Azure/azure-cli"
license=('MIT')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('2851775a1b0af4ebed272273ced7ba6e')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  rm "$pkgdir"/usr/lib/python3.?/site-packages/azure/__init__.py
  rm "$pkgdir"/usr/lib/python3.?/site-packages/azure/__pycache__/__init__.*
}
