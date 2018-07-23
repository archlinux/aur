# $Id$
# Maintainer: Shane Stone <shanewstone at gmail>

pkgname=python-proselint
pkgver=0.10.0
pkgrel=1
provides=('proselint')
pkgdesc="A linter for prose"
arch=('any')
url="https://github.com/amperser/proselint"
license=('BSD')
makedepends=('python-setuptools')
depends=('python-click' 'python-future' 'python-six')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amperser/proselint/archive/$pkgver.tar.gz")
sha256sums=('1064291cd3de1729f1005039a594f2a8d3a5bca1c64ec07d50afbed808ab922c')

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
