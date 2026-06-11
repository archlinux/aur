# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=lastlint
pkgver=0.4.0
pkgrel=2
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
b2sums=('398b579bcf7159a977d1ca993fcf2724a9a2bef8085ad8483d05c67c2b3bc69df6d7519a70e6c0b67ccf6b0d17197b15d07371a628a8aed63cd323d42d652103')
