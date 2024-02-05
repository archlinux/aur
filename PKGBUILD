# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-conda-inject
_name=${pkgname#python-}
pkgver=1.3.1
pkgrel=1
pkgdesc="Inject a conda environment into the current python environment"
arch=('any')
url="https://github.com/koesterlab/conda-inject"
license=('MIT')
depends=(python-yaml)
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('4ec172cdea816dd78fda95cab34227c9f0c360cd80adc5fa7b60fdb6c3c85cab')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
