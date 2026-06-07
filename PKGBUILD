# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=lastlint
pkgver=0.4.0
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
sha256sums=('fc71724ba07a151bf062d4895f83cc0090a7bf0863156f2ecaa866b13ac1e87f')
