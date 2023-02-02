# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-bflb-iot-tool
_name=${pkgname#python-}
pkgver=1.8.2
pkgrel=0
epoch=
pkgdesc="BOUFFALOLAB IOT TOOL"
arch=('any')
url="https://pypi.org/project/bflb-iot-tool"
license=('MIT')
groups=()
depends=(python python-pyserial python-ecdsa python-pycryptodome python-pylink-square)
makedepends=(python-build python-installer python-wheel)
checkdepends=()
optdepends=("jlink-software-and-documentation: Segger JLink software & documentation pack for Linux")
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('e514ce0fb0a709a6547f28254757867dd8a007dd5ee9a572808e822830f952a5')
#validpgpkeys=()

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf bflb_iot_tool/utils/jlink
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
