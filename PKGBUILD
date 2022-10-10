# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-bflb-mcu-tool
_name=${pkgname#python-}
pkgver=1.7.6.post2
pkgrel=1
epoch=
pkgdesc="BOUFFALOLAB MCU TOOL"
arch=('any')
url="https://pypi.org/project/bflb-mcu-tool"
license=(MIT)
groups=()
depends=(python)
makedepends=(python-build python-installer python-wheel)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('fd464acc2762d7cc5866a4c339ec3efd7aa6f2425594f49fce0694a93af37e51')
#validpgpkeys=()

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf bflb_mcu_tool/utils/jlink
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
