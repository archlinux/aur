# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-pyradiance
_name=${pkgname#python-}
pkgver=1.3.1
pkgrel=1
pkgdesc="Python inteface for Radiance"
arch=('x86_64')
url="https://pypi.org/project/pyradiance/"
license=('APACHE')
depends=(python-numpy)
makedepends=(
    python-build
    python-installer
    nanobind
    python-scikit-build-core
    python-wheel
)
source=(https://github.com/LBNL-ETA/pyradiance/archive/refs/tags/v$pkgver.tar.gz)
md5sums=('3d80d11d192d6caf99f91de493811f3b')

build() {
    cd "${_name//-/_}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name//-/_}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
