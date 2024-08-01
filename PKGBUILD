# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-bflb-crypto-plus
_name=bflb_crypto_plus
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="PyCryptoPlus is an extension to the Python Crypto module (www.pycrypto.org)."
arch=('any')
url="https://pypi.org/project/bflb-crypto-plus"
license=('LGPL-3.0-or-later')
groups=()
_pydeps=(
    )
depends=(
    python
    "${_pydeps[@]/#/python-}")
_pymakedeps=(
    build
    installer
    wheel
    setuptools
    pycryptodome)
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
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/b1/a4/bda733fe91c9b3424627597768bf8ab2cf683f1e81a88544d126f94536bd/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('b1b483874e5d2ecb49f9f85259715ad94b76f9627b3de9fa677f6ca5ce666242')
#validpgpkeys=()

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
