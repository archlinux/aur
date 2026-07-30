# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-olca-ipc
_name=${pkgname#python-}
pkgver=2.6.3
pkgrel=1
pkgdesc="API for communicating with an openLCA IPC server"
arch=('any')
url="https://github.com/GreenDelta/olca-ipc.py"
license=('MPL2')
depends=(python-requests python-olca-schema)
makedepends=(python-build python-installer python-wheel)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
sha256sums=('a5ab8d4ddfe1e47e07fbff0640812b6e55a3ebb9aaf3487a73f71eef9e862328')

build() {
    cd ${_name//-/_}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_name//-/_}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
