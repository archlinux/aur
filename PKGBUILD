# Maintainer: getzze <getzze at gmail dot com>

pkgname=python-pingouin
_name=${pkgname#python-}
pkgver=0.5.3
pkgrel=0
pkgdesc='Statistical package for Python'
arch=(any)
url=https://pingouin-stats.org/build/html/index.html
license=(GPL3)
depends=(
    python
    python-numpy
    python-scipy
    python-pandas
    python-matplotlib
    python-seaborn
    python-statsmodels
    python-scikit-learn
    python-pandas-flavor
    python-outdated
    python-tabulate
)
makedepends=(python-build python-installer python-wheel)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('7530eb7665d478b7d7da8cae3cdfca8ccb829b29eba1d1bf885fcbff3b23c64b')


build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
