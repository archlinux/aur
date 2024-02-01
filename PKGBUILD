# Maintainer: Jakub Klinkovský <lahwaacz cat archlinux dog org>

_name=dask-jobqueue
pkgname=python-$_name
pkgver=0.8.2
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
sha256sums=('e3aa46c24e7cd7bb2ed7f7472478cc6102dcd265fc8bdde512d106a175ae7cda')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
