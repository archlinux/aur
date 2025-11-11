# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-snakemake-interface-report-plugins
_name=${pkgname#python-}
pkgver=1.3.0
pkgrel=1
pkgdesc="The interface for Snakemake report plugins"
arch=('any')
url="https://github.com/snakemake/snakemake-interface-report-plugins"
license=('MIT')
depends=(python-snakemake-interface-common)
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('a926dee1be31a20050272c64c03656975e7c3bc1a46885807c927d523ebf0b9c')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
