# Maintainer: link2xt <link2xt@testrun.org>
_name=pyoprf
pkgname=python-$_name
pkgver=0.9.3
pkgrel=1
pkgdesc="Python bindings for the liboprf library"
arch=(any)
url="https://pypi.org/project/pyoprf/"
license=('LGPL-3.0-or-later')
depends=(liboprf python-pyserial-asyncio)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
b2sums=('22916713c559020c51094c854d0d49e60c7061b80a8ba1f870119556d39648021f7333c7bb1dea33d36608fef60636098bf246e1f0d7638f682af150bfbaf615')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
