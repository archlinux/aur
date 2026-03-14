# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
_name=snakemake-interface-storage-plugins
pkgname=python-$_name
pkgver=4.3.3
pkgrel=1
pkgdesc="Common functions and classes for Snakemake and its plugins"
arch=('any')
url=https://github.com/snakemake/snakemake-interface-storage-plugins
license=('MIT')
depends=(python-snakemake-interface-common python-wrapt python-throttler python-humanfriendly)
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('2eab894f21b53d452a94fb0f42dac63191950a0173de532cd37baa45477c2f9d')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
