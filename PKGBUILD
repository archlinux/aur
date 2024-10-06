# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-snakemake-interface-executor-plugins
_name=${pkgname#python-}
pkgver=9.3.2
pkgrel=1
pkgdesc="Common functions and classes for Snakemake and its plugins"
arch=('any')
url="https://github.com/snakemake/snakemake-interface-executor-plugins"
license=('MIT')
depends=(python-snakemake-interface-common python-throttler python-argparse_dataclass)
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('27864f20b83c23259f3f31a6faff9978cc874be38e613de3d79e20ddada78e72')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
