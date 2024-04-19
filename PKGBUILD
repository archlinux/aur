# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-snakemake-interface-storage-plugins
_name=${pkgname#python-}
pkgver=3.2.2
pkgrel=1
pkgdesc="Common functions and classes for Snakemake and its plugins"
arch=('any')
url="https://github.com/snakemake/snakemake-interface-storage-plugins"
license=('MIT')
depends=(python-snakemake-interface-common python-wrapt python-reretry python-throttler)
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('7277d4b2f82494a4779966c1cbac30489a2ef3ac2c299f1e56535026585c0050')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
