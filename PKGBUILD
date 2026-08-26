# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: alejandrogomez <alejandroogomez@gmail.com>

pkgname=pyhn
pkgver=0.4.0
pkgrel=1
pkgdesc="Hacker News command line client"
arch=('any')
url="https://pypi.python.org/pypi/pyhn/"
license=('MIT')
depends=(python-urwid python-requests)
makedepends=(python-build python-installer python-setuptools)
source=(https://pypi.io/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz)
b2sums=('01d86ed12cee1f8c485d75f9bbea1d59cc841b04df7ee9318749ad3de88979a119d55d80f67486aa621dd788eb66a8ae356550d825e4c9174bd041c31c6c989c')


build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
