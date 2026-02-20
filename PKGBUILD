# Maintainer: NGeorgescu <ngeorgescu at pm dot me>
pkgname=python-azure-functions
_name=azure_functions
pkgver=1.24.0
pkgrel=1
pkgdesc="Azure Functions Python SDK"
arch=('any')
url="https://github.com/Azure/azure-functions-python-library"
license=('MIT')
depends=('python' 'python-werkzeug')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('18ea1607c7a7268b7a1e1bd0cc28c5cc57a9db6baaacddb39ba0e9f865728187')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
