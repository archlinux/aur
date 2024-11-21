# Maintainer: devome <evinedeng@hotmail.com>
# Contributor: Atom Long <atom.long@hotmail.com>

_pkgname=pycognito
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=2024.5.1
pkgrel=1
pkgdesc="Python class to integrate Boto3's Cognito client so it is easy to login users. With SRP support."
arch=('any')
url="https://github.com/NabuCasa/pycognito"
license=("Apache-2.0")
depends=("python-boto3" "python-envs" "python-pyjwt" "python-requests")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('e211c66698c2c3dc8680e95107c2b4a922f504c3f7c179c27b8ee1ab0fc23ae4')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
