# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-snakemake-interface-common
_name=${pkgname#python-}
pkgver=1.20.2
pkgrel=1
pkgdesc="Common functions and classes for Snakemake and its plugins"
arch=('any')
url="https://github.com/snakemake/snakemake-interface-common"
license=('MIT')
makedepends=(python-build python-installer python-wheel python-poetry-core)
depends=(python-argparse_dataclass python-configargparse)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('433eae91d74a3d624cc84ce5eb90ee790395bba41769e8c6830ef8ef2e897bfb')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
