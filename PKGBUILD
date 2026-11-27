# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-olca-ipc
_name=${pkgname#python-}
pkgver=2.7.0
pkgrel=1
pkgdesc="API for communicating with an openLCA IPC server"
arch=('any')
url="https://github.com/GreenDelta/olca-ipc.py"
license=('MPL2')
depends=(python-requests python-olca-schema)
makedepends=(python-build python-installer python-wheel)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
sha256sums=('264324dfd4457fa281cfeaba954ff56ec5fa37cbf79f056037926c15b15b93de')

build() {
    cd ${_name//-/_}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_name//-/_}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
