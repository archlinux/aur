# Maintainer: getzze <getzze at gmail dot com>

pkgname=python-pandas-flavor
_pname=${pkgname#python-}
_name=${_pname//-/_}
pkgver=0.8.1
pkgrel=1
pkgdesc='The easy way to write your own Pandas flavor.'
arch=(any)
url=https://github.com/Zsailer/pandas_flavor
license=(MIT)
depends=(python python-pandas python-xarray)
makedepends=(python-build python-installer python-wheel python-setuptools python-setuptools-scm)
source=(https://files.pythonhosted.org/packages/source/${_pname::1}/$_pname/$_name-$pkgver.tar.gz)
sha256sums=('255fa5851833ee0132c4fdd6c1565ec1e938a8c2671c37e408006da6b2bdc366')


build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
