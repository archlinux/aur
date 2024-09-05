# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-olca-ipc
_name=${pkgname#python-}
pkgver=2.0.3
pkgrel=1
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
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
noextract=()
md5sums=('5b179d75dfd015c18b5dfba9063cb95f')

build() {
    cd ${_name//-/_}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_name//-/_}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
