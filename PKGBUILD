# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=python-glom
_name=${pkgname#python-}
_py=py3
pkgver=22.1.0
pkgrel=1
pkgdesc="Python's nested data operator"
arch=('any')
url='https://github.com/mahmoud/glom'
license=('BSD-3')
makedepends=('python-setuptools')
depends=('python-boltons' 'python-attrs' 'python-face')
source=(
  "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
)
sha256sums=(
  '1510c6587a8f9c64a246641b70033cbc5ebde99f02ad245693678038e821aeb5'
)


build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
