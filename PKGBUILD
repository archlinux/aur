# Maintainer: Joel Jensen <yobert@gmail.com>

_pkgname=google_cloud_secret_manager
pkgname=python-google-cloud-secret-manager
pkgver=2.24.0
pkgrel=1
pkgdesc="Google Cloud Secret Manager API client library"
arch=('any')
url="https://github.com/googleapis/google-cloud-python"
license=('Apache-2.0')
depends=('python>=3.7' 'python-google-api-core' 'python-google-auth' 'python-grpc-google-iam-v1' 'python-proto-plus')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest-asyncio')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ce573d40ffc2fb7d01719243a94ee17aa243ea642a6ae6c337501e58fbf642b5')

prepare() {
    cd "${_pkgname}-${pkgver}"
}

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_pkgname}-${pkgver}"
    pytest --noconftest -v
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

