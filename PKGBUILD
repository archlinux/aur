# Maintainer: piernov <piernov@piernov.org>
#
pkgname=python-types-tensorflow
_name=${pkgname#python-}
pkgver=2.17.0.20240820
pkgrel=1
pkgdesc="Typing stubs for tensorflow"
arch=('any')
url="https://pypi.org/project/types-tensorflow/"
license=('Apache-2.0')
depends=('python' 'python-numpy' 'python-types-protobuf' 'python-types-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8259f4458776cad1abc799fc996c38e74f5d3b7b150f6683315f40164af71414')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
