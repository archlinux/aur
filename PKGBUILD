# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-bflb-crypto-plus
_name=${pkgname#python-}
pkgver=1.0
pkgrel=7
epoch=
pkgdesc="PyCryptoPlus is an extension to the Python Crypto module (www.pycrypto.org)."
arch=('any')
url="https://pypi.org/project/bflb-crypto-plus"
license=('BSD-3-Clause')
groups=()
_pydeps=(
    setuptools
    pycryptodome
)
depends=(
    python
    "${_pydeps[@]/#/python-}"
)
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
sha256sums=('fb4062db0226c98831c645f63fc81d73d82511c30409f65a399b5876d6924edb')
#validpgpkeys=()

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
