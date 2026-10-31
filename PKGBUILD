# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=lastlint
pkgver=0.6.0
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
b2sums=('f53cbdfa81b6ac50caab59d819e70bcb6ac5f7486b60b1d4e2d4b40e01334f8f9e5e6f97dba7d5cce08f66b069d1c378cedb24aed13c4f3fcf2e028071eef92f')
