# Maintainer: piernov <piernov@piernov.org>
#
pkgname=python-types-tensorflow
_name=${pkgname#python-}
pkgver=2.18.0.20250304
pkgrel=1
pkgdesc="Typing stubs for tensorflow"
arch=('any')
url="https://pypi.org/project/types-tensorflow/"
license=('Apache-2.0')
depends=('python' 'python-numpy' 'python-types-protobuf' 'python-types-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('2637f92a1cd01489179323f386024facbcef357bfb6122b70e3d34cd7fc44eb4')

build() {
  cd "${_name//-/_}-$pkgver"
  python setup.py build
}

package() {
  cd "${_name//-/_}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
