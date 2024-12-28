# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-snakemake-interface-storage-plugins
_name=${pkgname#python-}
pkgver=3.3.0
pkgrel=2
pkgdesc="Common functions and classes for Snakemake and its plugins"
arch=('any')
url=https://github.com/snakemake/snakemake-interface-storage-plugins
license=('MIT')
depends=(python-snakemake-interface-common python-wrapt python-reretry python-throttler)
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('52f2d179652f324f7cf0881f3ed8adff2d54d660e6f5e192d778584f4c01bdde')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
