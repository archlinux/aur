# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname=python-astpretty
_name=astpretty
pkgver=2.1.0
pkgrel=1
pkgdesc="Pretty print the output of python stdlib 'ast.parse'."
arch=('any')
url="https://github.com/asottile/astpretty"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('9e96eb963eee5b68d609bea6b4db231f3bf9589674520ad880868a105e80bf40837ad7b24c81d1a1c0c451e75cbcae5fd4b9a76ec7f1e2087600de67e42d666d')

build() {
  cd "$_name-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
