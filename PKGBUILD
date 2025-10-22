# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
_name=snakemake-interface-storage-plugins
pkgname=python-$_name
pkgver=4.2.3
pkgrel=1
pkgdesc="Common functions and classes for Snakemake and its plugins"
arch=('any')
url=https://github.com/snakemake/snakemake-interface-storage-plugins
license=('MIT')
depends=(python-snakemake-interface-common python-wrapt python-reretry python-throttler)
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('a616256f9df9b72b4a107c6bbabdb3fd296debc2582efc452a7160094ba331b1')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
