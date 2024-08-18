# Maintainer: Kira Sokolova <Kyra256@proton.me>

pkgname=python-types-click
pkgver=7.1.8
pkgrel=1
pkgdesc="Typing stubs for click"
arch=("any")
url="https://pypi.org/project/types-click"
license=('Apache-2.0')
_name=${pkgname#python-}
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b6604968be6401dc516311ca50708a0a28baa7a0cb840efd7412f0dbbff4e092')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}/"
}
