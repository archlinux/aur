# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-trueskill
pkgver=0.4.5
pkgrel=1
pkgdesc="The video game rating system"
arch=('any')
url="https://trueskill.org/"
license=('BSD')
depends=('python-six')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sublee/trueskill/archive/v$pkgver.tar.gz")
sha256sums=('633459b2cc5765bf49c2202dea1ac0e7d51bb5a9a5fa093c4a5969ef23a3bd50')

build() {
  cd "trueskill-$pkgver"
  python setup.py build
}

package() {
  cd "trueskill-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
