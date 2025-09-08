# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
_name=snakemake-interface-scheduler-plugins
pkgname=python-$_name
pkgver=2.0.0
pkgrel=1
pkgdesc="Stable interface for interactions between Snakemake and its scheduler plugins"
arch=('any')
url="https://github.com/snakemake/snakemake-interface-scheduler-plugins"
license=('MIT')
depends=(python-snakemake-interface-common)
makedepends=(python-build python-installer python-wheel python-hatchling)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('2674c1e5085c4fec2e5cbf0e82f994db30c5eafd00922d55b3f3d8b8d00e8f41')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
