# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-pyradiance
_name=${pkgname#python-}
pkgver=1.2.4
pkgrel=1
pkgdesc="Python inteface for Radiance"
arch=('x86_64')
url="https://pypi.org/project/pyradiance/"
license=('APACHE')
depends=(python-numpy)
makedepends=(
    python-build
    python-installer
    python-nanobind
    python-scikit-build-core
    python-wheel
)
source=(https://github.com/LBNL-ETA/pyradiance/archive/refs/tags/v$pkgver.tar.gz)
md5sums=('dee532302a3a07f9c65c0b74e4ee3190')

build() {
    cd "${_name//-/_}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name//-/_}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
