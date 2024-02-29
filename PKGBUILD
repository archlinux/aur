# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-snakemake-interface-report-plugins
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=1
pkgdesc="The interface for Snakemake report plugins"
arch=('any')
url="https://github.com/snakemake/snakemake-interface-report-plugins"
license=('MIT')
depends=(python-snakemake-interface-common)
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('3b2bbdeb58ed99ead7830862d25aa3fb28c6745132ed55b33053b9eb78ad0717')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
