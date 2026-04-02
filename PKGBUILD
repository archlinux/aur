# Maintainer: Nathaniel van Diepen <eeems@eeems.codes>
pkgname=python-oras
pkgver=0.2.42
pkgrel=1
pkgdesc="OCI Registry As Storage (ORAS) Python client library"
arch=('any')
url="https://github.com/oras-project/oras-py"
license=('Apache-2.0')
depends=(
  'python-jsonschema'
  'python-requests'
)
optdepends=(
  'python-docker: support for docker config authentication'
  'python-boto3: support for AWS ECR authentication'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/o/oras/oras-${pkgver}.tar.gz")
sha256sums=('51d17088e5dffdeb585dd930bdccb4329762bef4af3f18600392ebae525a9231')

build() {
    cd "oras-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "oras-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
