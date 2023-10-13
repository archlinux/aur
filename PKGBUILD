# Maintainer: getzze <getzze at gmail dot com>

pkgname=python-pandas-flavor
_pname=${pkgname#python-}
_name=${_pname//-/_}
pkgver=0.6.0
pkgrel=0
pkgdesc='The easy way to write your own Pandas flavor.'
arch=(any)
url=https://github.com/Zsailer/pandas_flavor
license=(MIT)
depends=(python python-pandas python-xarray)
makedepends=(python-build python-installer python-wheel)
source=(https://files.pythonhosted.org/packages/source/${_pname::1}/$_pname/$_name-$pkgver.tar.gz)
sha256sums=('9fb8735102dcb65dae7ee5cda12b393ca134a909ebcfc0262c5cdc1d79ba007f')


build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
