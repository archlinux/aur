# Maintainer: getzze <getzze at gmail dot com>

pkgname=python-pandas-flavor
_pname=${pkgname#python-}
_name=${_pname//-/_}
pkgver=0.7.0
pkgrel=0
pkgdesc='The easy way to write your own Pandas flavor.'
arch=(any)
url=https://github.com/Zsailer/pandas_flavor
license=(MIT)
depends=(python python-pandas python-xarray)
makedepends=(python-build python-installer python-wheel)
source=(https://files.pythonhosted.org/packages/source/${_pname::1}/$_pname/$_name-$pkgver.tar.gz)
sha256sums=('617bf9f96902017afc9bd284f611592bce91806d3c7ae34ad64f6edab3edaf7e')


build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
