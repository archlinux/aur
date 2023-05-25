# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=fisx
pkgname=python-$_name
pkgver=1.3.1
pkgrel=1
pkgdesc="Quantitative X-Ray Fluorescence Analysis Support Library"
arch=('x86_64')
url='https://github.com/vasole/fisx'
license=('MIT')
depends=(python-numpy)
makedepends=(python-setuptools python-numpy cython)
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('483894b3272b6c7d457d193f2a31bd417083fc9035b6965c43fd32223a3f6a4b')
build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
