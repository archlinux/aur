# Maintainer: Nathaniel van Diepen <eeems@eeems.codes>
pkgname=python-oras
pkgver=0.2.38
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
sha256sums=('58482f78275cb5cc9fdf135248ca878a19204428a51bd3a1ca24c32714d35341')

build() {
    cd "oras-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "oras-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
