# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-snakemake-interface-storage-plugins
_name=${pkgname#python-}
pkgver=3.2.4
pkgrel=1
pkgdesc="Common functions and classes for Snakemake and its plugins"
arch=('any')
url="https://github.com/snakemake/snakemake-interface-storage-plugins"
license=('MIT')
depends=(python-snakemake-interface-common python-wrapt python-reretry python-throttler)
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('d8804000117aff7b5b7688add1390051ab69e17f5e1b8e5db654fabedee21e49')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
