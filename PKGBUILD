# Maintainer: piernov <piernov@piernov.org>
#
pkgname=python-types-tensorflow
_name=${pkgname#python-}
pkgver=2.18.0.20250516
pkgrel=1
pkgdesc="Typing stubs for tensorflow"
arch=('any')
url="https://pypi.org/project/types-tensorflow/"
license=('Apache-2.0')
depends=('python' 'python-numpy' 'python-types-protobuf' 'python-types-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('5777e1848e52b1f4a87b44ce1ec738b7407a744669bab87ec0f5f1e0ce6bd1fe')

build() {
  cd "${_name//-/_}-$pkgver"
  python setup.py build
}

package() {
  cd "${_name//-/_}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
