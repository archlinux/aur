# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-bflb-mcu-tool
_name=${pkgname#python-}
pkgver=1.7.1.post1
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
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/c9/e1/a31fd8e26e9179674a2cfaf677fedaa58413b30811313c3cc7c4b7666dd8/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('8a11cf47aae88f862c57489a2614e3c3189ea1f6aae1e26562cc6c00a3b65f1d')
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
