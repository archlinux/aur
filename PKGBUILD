# Maintainer: Jakub Klinkovský <lahwaacz cat archlinux dog org>

_name=dask-jobqueue
pkgname=python-$_name
pkgver=0.8.5
pkgrel=1
pkgdesc="Deploy Dask on job schedulers like PBS, SLURM, and SGE"
url="https://github.com/dask/dask-jobqueue"
depends=(
    python-dask
    python-distributed
)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
)
license=(BSD-3-Clause)
arch=(any)
source=("$pkgname-$pkgver::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('77f2a4ab8d0e96dce2025768178d139140abd359589154bacc99350d36465c20')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
