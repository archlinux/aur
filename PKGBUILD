# Maintainer: link2xt <link2xt@testrun.org>
_name=pyequihash
pkgname=python-$_name
pkgver=0.2
pkgrel=1
pkgdesc="Python bindings for the libequihash library"
arch=(any)
url="https://pypi.org/project/pyequihash/"
license=('GPL-3.0-or-later')
depends=(equihash)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
b2sums=(3995f81936197f9c3351f2f9c843a1b0a3418b5e89f9d805c4f846010a885bfc2cff04f0eec537bf6e2d391b5ca0e0716262527222ed32b7a5b19b3f274dcb12)

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
