# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
_name=snakemake-interface-logger-plugins
pkgname=python-$_name
pkgver=2.0.0
pkgrel=1
pkgdesc="Snakemake Logger Plugin Interface"
arch=('any')
url=https://github.com/snakemake/snakemake-interface-logger-plugins
license=('MIT')
depends=(python-snakemake-interface-common)
makedepends=(python-build python-installer python-wheel python-hatchling)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('1577df5f30b430690a0c31d11e90085e3207bf0ad929170d8242a6f48a74f2b2')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
