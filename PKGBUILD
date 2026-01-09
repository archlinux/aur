# Maintainer: piernov <piernov@piernov.org>
#
pkgname=python-types-protobuf
_name=${pkgname#python-}
pkgver=6.32.1.20251210
pkgrel=1
pkgdesc="Typing stubs for protobuf"
arch=('any')
url="https://pypi.org/project/types-protobuf/"
license=('Apache-2.0')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('c698bb3f020274b1a2798ae09dc773728ce3f75209a35187bd11916ebfde6763')

build() {
  cd "${_name//-/_}-$pkgver"
  python setup.py build
}

package() {
  cd "${_name//-/_}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
