# $Id$
# Maintainer: Shane Stone <shanewstone at gmail>

pkgname=python-proselint
pkgver=0.9.0
pkgrel=1
provides=('proselint')
pkgdesc="A linter for prose"
arch=('any')
url="https://github.com/amperser/proselint"
license=('BSD')
makedepends=('python-setuptools')
depends=('python-click' 'python-future' 'python-six')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amperser/proselint/archive/$pkgver.tar.gz")
sha256sums=('4b55bf2361eb036dfc87359038b83347391e92ab72bb487d75f6897f8a7b8353')

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
