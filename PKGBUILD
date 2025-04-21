# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
_name=snakemake-interface-storage-plugins
pkgname=python-$_name
pkgver=4.2.1
pkgrel=1
pkgdesc="Common functions and classes for Snakemake and its plugins"
arch=('any')
url=https://github.com/snakemake/snakemake-interface-storage-plugins
license=('MIT')
depends=(python-snakemake-interface-common python-wrapt python-reretry python-throttler)
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('649c760926fe7d0b1643fb650f2d0eda24909d94d2633d29bd2e438fd20742fe')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
