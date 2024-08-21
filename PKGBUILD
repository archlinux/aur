# Maintainer: piernov <piernov@piernov.org>
#
pkgname=python-types-protobuf
_name=${pkgname#python-}
pkgver=5.27.0.20240626
pkgrel=1
pkgdesc="Typing stubs for protobuf"
arch=('any')
url="https://pypi.org/project/types-protobuf/"
license=('Apache-2.0')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('683ba14043bade6785e3f937a7498f243b37881a91ac8d81b9202ecf8b191e9c')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
