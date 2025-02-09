# Maintainer: piernov <piernov@piernov.org>
#
pkgname=python-types-protobuf
_name=${pkgname#python-}
pkgver=5.29.1.20250208
pkgrel=1
pkgdesc="Typing stubs for protobuf"
arch=('any')
url="https://pypi.org/project/types-protobuf/"
license=('Apache-2.0')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('c1acd6a59ab554dbe09b5d1fa7dd701e2fcfb2212937a3af1c03b736060b792a')

build() {
  cd "${_name//-/_}-$pkgver"
  python setup.py build
}

package() {
  cd "${_name//-/_}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
