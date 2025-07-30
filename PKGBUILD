# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
_name=snakemake-interface-storage-plugins
pkgname=python-$_name
pkgver=4.2.2
pkgrel=1
pkgdesc="Common functions and classes for Snakemake and its plugins"
arch=('any')
url=https://github.com/snakemake/snakemake-interface-storage-plugins
license=('MIT')
depends=(python-snakemake-interface-common python-wrapt python-reretry python-throttler)
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('56f9d3f3847a1736a50e9d53f6c87322ac8803f88b7bb0f972a7998ecae21da1')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
