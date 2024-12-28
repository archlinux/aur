# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-snakemake-interface-report-plugins
_name=${pkgname#python-}
pkgver=1.1.0
pkgrel=2
pkgdesc="The interface for Snakemake report plugins"
arch=('any')
url="https://github.com/snakemake/snakemake-interface-report-plugins"
license=('MIT')
depends=(python-snakemake-interface-common)
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('5b0fa1badfa92205920599c3df539137e9978e3caac9da63589fd642460c4d85')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
