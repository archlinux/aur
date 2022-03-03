# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-bflb-iot-tool
_name=${pkgname#python-}
pkgver=1.6.8
pkgrel=1
epoch=
pkgdesc="BOUFFALOLAB IOT TOOL"
arch=('any')
url="https://pypi.org/project/bflb-iot-tool"
license=('unkown')
groups=()
depends=('python' )
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/51/5d/181f57205588d0670508f118d590e4e75f6f35ac77ebd54e9b102560ae6e/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('0209ef5af68994d486dfe3cbb49b5201ffe670a88602122258a9c908446c542e')
#validpgpkeys=()

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
