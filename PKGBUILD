# Maintainer: Robert Schiele <rschiele@gmail.com>

pkgname=python-ldraw-to-scad
_name=${pkgname#python-}
pkgver=0.4.0
pkgrel=1
pkgdesc="The LDraw to OpenSCAD converter library"
arch=('any')
url="https://github.com/orionrobots/ldraw-to-scad/"
license=('Apache-2.0')
depends=('python-importlib_resources')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=('cf179112cc7faadf4d0e0d1dc93231abea3146fe2f412d4b156d75bad4c1e38b')

build() {
    cd ${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_name}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
