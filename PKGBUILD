# Maintainer: Harriet O'Brien <harrietobrien@protonmail.com>

pkgname=python-torch-ema
_pkgname=torch_ema
pkgver=0.3
pkgrel=1
pkgdesc="Exponential Moving Average of PyTorch model parameters"
arch=('any')
url="https://github.com/fadel/pytorch_ema"
license=('MIT')
depends=(
    'python-pytorch'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('5a3595405fa311995f01291a1d4a9242d6be08a0fc9db29152ec6cfd586ea414')

build() {
    cd "${_pkgname}-${pkgver}"
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    /usr/bin/python -m installer --destdir="${pkgdir}" dist/*.whl
}
