# Maintainer: Sam Linnfer <littlelightlittlefire@gmail.com>

pkgname='python-arviz'
pkgver=0.18.0
pkgrel=2
pkgdesc="Exploratory analysis of Bayesian models with Python"
url="https://github.com/arviz-devs/arviz"
arch=('any')
license=('Apache License 2.0')
depends=('python>=3.10' 'python-numpy' 'python-scipy' 'python-xarray-einstats' 'python-matplotlib' 'python-h5netcdf' 'python-dm-tree')
makedepends=(python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::https://github.com/arviz-devs/arviz/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e3fa842aeefef722ae4e1d5f853a0b7e1337ef1720d31d6ff85f3ff7bd6716c0')

build() {
    cd "arviz-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "arviz-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
