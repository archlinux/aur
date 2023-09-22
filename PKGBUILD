# Maintainer: Sam Linnfer <littlelightlittlefire@gmail.com>

pkgname='python-arviz'
pkgver=0.16.1
pkgrel=1
pkgdesc="Exploratory analysis of Bayesian models with Python"
url="https://arviz-devs.github.io/arviz/"
arch=('any')
license=('Apache License 2.0')
depends=('python>=3.5' 'python-numpy' 'python-scipy' 'python-xarray-einstats' 'python-matplotlib' 'python-h5netcdf')
makedepends=(python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::https://github.com/arviz-devs/arviz/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1986295c07a031e805ee34f63a55e81f3f8bcf1399330c5d8e10fa0bfa80a0c2')

build() {
    cd "arviz-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "arviz-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
