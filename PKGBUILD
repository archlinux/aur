# Maintainer: piernov <piernov@piernov.org>
#
pkgname=python-types-protobuf
_name=${pkgname#python-}
pkgver=7.35.1.20260906
pkgrel=1
pkgdesc="Typing stubs for protobuf"
arch=('any')
url="https://pypi.org/project/types-protobuf/"
license=('Apache-2.0')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('efd1a3862d4c967dad5512ef8d56b1530ac84f182c41735b94004756518c4998')

build() {
  cd "${_name//-/_}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name//-/_}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
