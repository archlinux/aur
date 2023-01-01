# Python package author: tommyod <tommy.odland@gmail.com>
pkgname=python-efficient_apriori
_name=${pkgname#python-}
pkgver=2.0.1
pkgrel=1
pkgdesc="An efficient Python implementation of the Apriori algorithm."
arch=(any)
url="https://github.com/tommyod/Efficient-Apriori"
license=(MIT)
makedepends=('python-build' 'python-installer' 'python-wheel')
depends=('python>=3.6')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
sha256sums=('ab0ec6df70c0386d378dc80494393b1403c44f89b5115091cdbb89c066ad1616')
