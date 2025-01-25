# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-qcc74x-crypto-plus
_name=${pkgname#python-}
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="PyCrypto Cipher extension."
arch=('any')
url="https://pypi.org/project/qcc74x-crypto-plus"
license=('LGPL-3.0-or-later')
groups=()
_pydeps=(
    bflb-crypto-plus
    setuptools
    pycryptodome
)
depends=(
    python
    "${_pydeps[@]/#/python-}")
_pymakedeps=(
    build
    installer
    wheel
)
makedepends=(
    "${_pymakedeps[@]/#/python-}")
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
sha256sums=('efada10cfbca5b68881a8d33818c832cb06c92618aab71cd1b48c6f91b105b67')
#validpgpkeys=()

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
