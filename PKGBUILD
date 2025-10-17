# Maintainer: quietvoid <tcChlisop0@gmail.com>

pkgname="bscpylgtv"
pkgver=0.5.0
pkgrel=1
pkgdesc="Library to control webOS based LG TV devices"
_rootdir="${pkgname}-${pkgver}"
url="https://github.com/chros73/bscpylgtv"
depends=('python' 'python-numpy' 'python-websockets' 'python-sqlitedict')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('x86_64')
source=("${_rootdir}.tar.gz::https://github.com/chros73/bscpylgtv/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('c809a5be3dabcbdb6509006bb0c7f7106b4c4d7b0c0cd0e3135e23146cb65a5b3d287f4244e196e13896ae012f991a7f0f787aaa213caaccd7acf4fe1a8540df')

build() {
    cd "${_rootdir}"
    python -m build --wheel
}

package() {
    cd "${_rootdir}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
