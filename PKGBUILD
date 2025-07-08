# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-snakemake-interface-common
_name=${pkgname#python-}
pkgver=1.20.1
pkgrel=1
pkgdesc="Common functions and classes for Snakemake and its plugins"
arch=('any')
url="https://github.com/snakemake/snakemake-interface-common"
license=('MIT')
makedepends=(python-build python-installer python-wheel python-poetry-core)
depends=(python-argparse_dataclass python-configargparse)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('8a8a20e58ed14962835404fbe49ca52c442886a04c8a3db9c0346036bd492353')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
