# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=lastlint
pkgver=0.5.1
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
b2sums=('c8bd4aed41328cdc1c8d2dc1f3ada7a21f13e02fa5497588c4561980394c21aed44a9be18a7c2f9869d8febaf505fa905899e1103638d32cb973d1f165ac171e')
