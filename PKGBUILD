# $Id$
# Maintainer: Shane Stone <shanewstone at gmail>

pkgname=python-proselint
pkgver=0.8.0
pkgrel=1
provides=('proselint')
pkgdesc="A linter for prose"
arch=('any')
url="https://github.com/amperser/proselint"
license=('BSD')
makedepends=('python-setuptools')
depends=('python-click' 'python-future' 'python-six')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amperser/proselint/archive/$pkgver.tar.gz")
sha256sums=('d2044d0c4599e953363f73a72c2636695a996ca58e6641df9a2f4ab10e1ce430')

build() {
  cd proselint-$pkgver
  python setup.py build
}

package() {
  cd proselint-$pkgver

  python setup.py install --skip-build --root="$pkgdir" --optimize=1

  rm -rfv $pkgdir/usr/lib/python3*/site-packages/tests

  install -Dm644 LICENSE.md $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
