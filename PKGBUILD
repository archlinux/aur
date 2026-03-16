# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-conda-inject
_name=${pkgname#python-}
pkgver=1.3.2
pkgrel=2
pkgdesc="Inject a conda environment into the current python environment"
arch=('any')
url="https://github.com/koesterlab/conda-inject"
license=('MIT')
depends=(python-yaml)
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('3259eeda320a65015ed9978adb54ab21dd831c03d0c08255c2e2fe068df204f0')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
