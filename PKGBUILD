# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
_name=snakemake-interface-logger-plugins
pkgname=python-$_name
pkgver=2.1.0
pkgrel=1
pkgdesc="Snakemake Logger Plugin Interface"
arch=('any')
url=https://github.com/snakemake/snakemake-interface-logger-plugins
license=('MIT')
depends=(python-snakemake-interface-common)
makedepends=(python-build python-installer python-wheel python-hatchling)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('f40bb0117c7d5feeed9a53258e86911c34aa6f0020e591bf36f3308626d44df6')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
