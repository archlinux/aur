# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-olca-ipc
_name=${pkgname#python-}
pkgver=2.0.2
pkgrel=2
pkgdesc="API for communicating with an openLCA IPC server"
arch=('x86_64')
url="https://github.com/GreenDelta/olca-ipc.py"
license=('MPL2')
groups=()
depends=()
makedepends=(python-build python-installer python-wheel)
optdepends=()
provides=('python-olca-ipc')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
noextract=()
md5sums=('b3d7142c99c7ae843902a9fd7a860a3f')

build() {
    cd ${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_name}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
