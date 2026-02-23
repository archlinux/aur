# Maintainer: link2xt <link2xt@testrun.org>
_name=pyoprf
pkgname=python-$_name
pkgver=0.9.4
pkgrel=1
pkgdesc="Python bindings for the liboprf library"
arch=(any)
url="https://pypi.org/project/pyoprf/"
license=('LGPL-3.0-or-later')
depends=(liboprf python-pyserial-asyncio)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
b2sums=('6f9420255ec6b729d3a362833aa7601373022ff5bef6ddee97793e4f999543a518887e3468a2e148c10ed9eb000bb1ed15e83ace6619f2ff6525ea99030d8dae')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
