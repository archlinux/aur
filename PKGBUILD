# Maintainer: Sam Linnfer <littlelightlittlefire@gmail.com>

pkgname='python-arviz'
pkgver=0.22.0
pkgrel=1
pkgdesc="Exploratory analysis of Bayesian models with Python"
url="https://github.com/arviz-devs/arviz"
arch=('any')
license=('Apache License 2.0')
depends=('python>=3.10' 'python-numpy' 'python-scipy' 'python-pandas' 'python-xarray-einstats' 'python-matplotlib' 'python-h5netcdf' 'python-typing_extensions')
makedepends=(python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::https://github.com/arviz-devs/arviz/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('69f63ef24118bf6d82069658cb20ae1ae69ffe56472e04be7db6731b9568a367')

build() {
    cd "arviz-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "arviz-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
