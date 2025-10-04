# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-pyradiance
_name=${pkgname#python-}
pkgver=1.1.5
pkgrel=1
pkgdesc="Python inteface for Radiance"
arch=('x86_64')
url="https://pypi.org/project/pyradiance/"
license=('APACHE')
groups=()
depends=(python-numpy)
makedepends=(python-build python-installer python-wheel)
optdepends=()
provides=('python-pyradiance')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
# source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz)
source=(https://github.com/LBNL-ETA/pyradiance/archive/refs/tags/v1.1.5.tar.gz)
noextract=()
md5sums=('24359016fd6ebf12fc1ec364b102a825')

build() {
    cd "${_name//-/_}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name//-/_}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
