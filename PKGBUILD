# Maintainer: Sam Linnfer <littlelightlittlefire@gmail.com>

pkgname='python-arviz'
pkgver=0.20.0
pkgrel=1
pkgdesc="Exploratory analysis of Bayesian models with Python"
url="https://github.com/arviz-devs/arviz"
arch=('any')
license=('Apache License 2.0')
depends=('python>=3.10' 'python-numpy' 'python-scipy' 'python-xarray-einstats' 'python-matplotlib' 'python-h5netcdf' 'python-dm-tree')
makedepends=(python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::https://github.com/arviz-devs/arviz/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bf975726756d48e4e57a2a5131b1f9771786b25b8f0e9dbead85fdc1ac017979')

build() {
    cd "arviz-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "arviz-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
