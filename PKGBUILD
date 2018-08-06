# $Id$
# Maintainer: Shane Stone <shanewstone at gmail>

pkgname=python-proselint
pkgver=0.10.2
pkgrel=1
provides=('proselint')
pkgdesc="A linter for prose"
arch=('any')
url="https://github.com/amperser/proselint"
license=('BSD')
makedepends=('python-setuptools')
depends=('python-click' 'python-future' 'python-six')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amperser/proselint/archive/$pkgver.tar.gz")
sha256sums=('5819e8e4c8ddcf282aabbb10613dc195796e682d36b046befbdfa7f8e8f080d5')

build() {
  cd proselint-$pkgver

  python setup.py build
}

package() {
  cd proselint-$pkgver

  python setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE.md $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
