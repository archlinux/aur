# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=lastlint
pkgver=0.4.1
pkgrel=1
pkgdesc="Linter for Evan Chen's LaTeX style guide"
arch=(any)
url=https://github.com/cjquines/lastlint
license=(MIT)
depends=(python)
makedepends=(python-hatchling)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
b2sums=('eb860ea7023f281994d4ecffdcd3213b23d78459e5b5088de7d863de000e154f1753b2e854e387f0cd9811480bd6156530e2cdf0c8ac9b928d7b5698193cb101')
