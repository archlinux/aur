# Maintainer: NGeorgescu <ngeorgescu at pm dot me>
pkgname=python-azure-functions-durable
_pyname=azure_functions_durable
_dirname=azure-functions-durable
pkgver=1.5.0
pkgrel=1
pkgdesc="Durable Functions for Python"
arch=('any')
url="https://github.com/Azure/azure-functions-durable-python"
license=('MIT')
depends=('python' 'python-azure-functions' 'python-aiohttp' 'python-requests' 'python-dateutil' 'python-furl' 'python-opentelemetry-api')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('131fbdf08fa1140d94dc3948fcf9000d8da58aaa5a0ffc4db0ea3be97d5551e2')

build() {
    cd "${_dirname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_dirname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
