# Maintainer: Evan Edwards <evan@ejedev.com>

pkgname=python-glom
_name=${pkgname#python-}
_py=py3
pkgver=23.5.0
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
  '06af5e3486aacc59382ba34e53ebeabd7a9345d78f7dbcbee26f03baa4b83bac'
)


build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
