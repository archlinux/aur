# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
_name=snakemake-interface-logger-plugins
pkgname=python-$_name
pkgver=1.2.3
pkgrel=1
pkgdesc="Snakemake Logger Plugin Interface"
arch=('any')
url=https://github.com/snakemake/snakemake-interface-logger-plugins
license=('MIT')
depends=(python-snakemake-interface-common)
makedepends=(python-build python-installer python-wheel python-hatchling)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('b2cf926f06bc73f97a82cf7713f4f607f8735f128be3465ad1badfa8b9a04bb4')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
