# Maintainer: Oystein Sture <oysstu a.t gmail.com>
# Contributor:

pkgname=python-pyvistaqt
pkgver=0.11.1
pkgrel=1
_pkgbase=${pkgname#python-}
pkgdesc="Qt support for PyVista"
arch=("any")
license=("MIT")
url="https://github.com/pyvista/pyvistaqt"
depends=('python' 'python-pyvista' 'python-qtpy')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/pyvista/pyvistaqt/archive/${pkgver}.tar.gz")
sha256sums=('2666b213fe0f088692eea1b40b4ea96cdabf584ced379e2b2a40deb62631eedd')

build() {
    cd "$_pkgbase-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgbase-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
