# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=lastlint
pkgver=0.5.0
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
b2sums=('d9be2f91ac9c74934270ececbfd0bb64d40077d66776ebcb7d3b7adfe0cb9ca3d7faffdea8e158c21e04fa658bef2124c23115ba7b46854795d547bc17ff248d')
