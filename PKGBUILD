# Maintainer: piernov <piernov@piernov.org>
#
pkgname=python-types-protobuf
_name=${pkgname#python-}
pkgver=6.30.2.20250703
pkgrel=1
pkgdesc="Typing stubs for protobuf"
arch=('any')
url="https://pypi.org/project/types-protobuf/"
license=('Apache-2.0')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('609a974754bbb71fa178fc641f51050395e8e1849f49d0420a6281ed8d1ddf46')

build() {
  cd "${_name//-/_}-$pkgver"
  python setup.py build
}

package() {
  cd "${_name//-/_}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
