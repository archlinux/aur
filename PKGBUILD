# Maintainer: quietvoid <tcChlisop0@gmail.com>

pkgname="bscpylgtv"
pkgver=0.5.2
pkgrel=1
pkgdesc="Library to control webOS based LG TV devices"
_rootdir="${pkgname}-${pkgver}"
url="https://github.com/chros73/bscpylgtv"
depends=('python' 'python-numpy' 'python-websockets' 'python-sqlitedict')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('x86_64')
source=("${_rootdir}.tar.gz::https://github.com/chros73/bscpylgtv/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('ecbcbdf875335064a9c47d7da0589f8f476f782f7cb8c731d548880b6dfe14da2cac465789e0d760c78ef3dae3449be65457591425dd2d4d98cf61028e37ace3')

build() {
    cd "${_rootdir}"
    python -m build --wheel
}

package() {
    cd "${_rootdir}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
