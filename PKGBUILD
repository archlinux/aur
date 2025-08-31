# Maintainer: quietvoid <tcChlisop0@gmail.com>

pkgname="bscpylgtv"
pkgver=0.4.8
pkgrel=1
pkgdesc="Library to control webOS based LG TV devices"
_rootdir="${pkgname}-${pkgver}"
url="https://github.com/chros73/bscpylgtv"
depends=('python' 'python-numpy' 'python-websockets' 'python-sqlitedict')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('x86_64')
source=("${_rootdir}.tar.gz::https://github.com/chros73/bscpylgtv/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('e8e31cdb8aedd2fb4ec897814dd39f69e903b599ad4c83414a77bbdae1f99d8aca645c0343c3bd9dc7168ea25e8c02f88ac246a1b0f3d68918e3cf01a11c31ee')

build() {
    cd "${_rootdir}"
    python -m build --wheel
}

package() {
    cd "${_rootdir}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
