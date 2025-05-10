# Maintainer: Robert Schiele <rschiele@gmail.com>

pkgname=python-ldraw-to-scad
_name=${pkgname#python-}
pkgver=0.5.0
pkgrel=1
pkgdesc="The LDraw to OpenSCAD converter library"
arch=('any')
url="https://github.com/orionrobots/ldraw-to-scad/"
license=('Apache-2.0')
depends=('python-importlib_resources')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('42d0eb2476ed618f7545fc5ccc6bd9d6f46b1ca1e0736a251935507b0be001e6')

build() {
    cd ${_name//-/_}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_name//-/_}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
