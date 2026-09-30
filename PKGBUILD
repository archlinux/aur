# Maintainer: quietvoid <tcChlisop0@gmail.com>

pkgname="bscpylgtv"
pkgver=0.5.5
pkgrel=1
pkgdesc="Library to control webOS based LG TV devices"
_rootdir="${pkgname}-${pkgver}"
url="https://github.com/chros73/bscpylgtv"
depends=('python' 'python-numpy' 'python-websockets' 'python-sqlitedict')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('x86_64')
source=("${_rootdir}.tar.gz::https://github.com/chros73/bscpylgtv/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('f152923bd6d0589a88d80140cd9c7376a3e913d99c3719c92057878dae10be36bcb7710a395bc58b37073f5ab18293ab2bdb7a00d64ecaddf51a7e1c325af507')

build() {
    cd "${_rootdir}"
    python -m build --wheel
}

package() {
    cd "${_rootdir}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
