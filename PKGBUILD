# $Id$
# Maintainer: Shane Stone <shanewstone at gmail>

pkgname=python-proselint
pkgver=0.10.1
pkgrel=1
provides=('proselint')
pkgdesc="A linter for prose"
arch=('any')
url="https://github.com/amperser/proselint"
license=('BSD')
makedepends=('python-setuptools')
depends=('python-click' 'python-future' 'python-six')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amperser/proselint/archive/$pkgver.tar.gz")
sha256sums=('ff0f447c4d9fbf60efcd7aaaeb0090409ca41740287a9520918af5ccd47e18f8')

build() {
  cd proselint-$pkgver

  python setup.py build
}

package() {
  cd proselint-$pkgver

  python setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE.md $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
