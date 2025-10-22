# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-snakemake-interface-common
_name=${pkgname#python-}
pkgver=1.22.0
pkgrel=1
pkgdesc="Common functions and classes for Snakemake and its plugins"
arch=('any')
url="https://github.com/snakemake/snakemake-interface-common"
license=('MIT')
makedepends=(python-build python-installer python-wheel python-packaging python-poetry-core)
depends=(python-argparse_dataclass python-configargparse)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('c2f1e1495b5cb37ffec6327003ef29c2a496dbff1fda94b20a821c1cadbbe733')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
