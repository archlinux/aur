# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
_name=snakemake-interface-logger-plugins
pkgname=python-$_name
pkgver=1.2.4
pkgrel=1
pkgdesc="Snakemake Logger Plugin Interface"
arch=('any')
url=https://github.com/snakemake/snakemake-interface-logger-plugins
license=('MIT')
depends=(python-snakemake-interface-common)
makedepends=(python-build python-installer python-wheel python-hatchling)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('d1a062b2fc0af8ff5345c2725a6a96f184a41a16671663b4c5800a200bf3d4c8')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
