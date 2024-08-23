# Maintainer: Jakub Klinkovský <lahwaacz cat archlinux dog org>

_name=dask-jobqueue
pkgname=python-$_name
pkgver=0.9.0
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
sha256sums=('02de8048c05d97bc0f2f3f73dce345eacf9c8cab60183b4f0f9e0647ca5af363')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
