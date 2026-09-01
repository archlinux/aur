# Maintainer: quietvoid <tcChlisop0@gmail.com>

pkgname="bscpylgtv"
pkgver=0.5.4
pkgrel=1
pkgdesc="Library to control webOS based LG TV devices"
_rootdir="${pkgname}-${pkgver}"
url="https://github.com/chros73/bscpylgtv"
depends=('python' 'python-numpy' 'python-websockets' 'python-sqlitedict')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('x86_64')
source=("${_rootdir}.tar.gz::https://github.com/chros73/bscpylgtv/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('6cee07103a7c53d60ef84830a55c707528a131f1855ae17870a0569b5d3602d3ba3a58a99f147ac03d86a6944dddff0108b299995ef1d49ad57a0f97e29594b3')

build() {
    cd "${_rootdir}"
    python -m build --wheel
}

package() {
    cd "${_rootdir}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
