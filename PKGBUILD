# Maintainer: Brody <archfan at brodix dot de>

_pyname=google_cloud_trace
pkgname=python-google-cloud-trace
pkgver=1.16.0
pkgrel=1
pkgdesc='Google Cloud Trace API client library'
url=https://github.com/googleapis/google-cloud-python
arch=(any)
license=(Apache-2.0)
depends=(
  python
  python-google-api-core
  python-google-auth
  python-proto-plus
  python-protobuf
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
optdepends=()
source=(${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz)
b2sums=('4240a8735f6317058308c9a3090eac0e9637f15f1c34c28bd3de66ff3a4100a1387856c096e5ff8e6ce87d72afab2cd1dccdd5c262de32406df2a065e53c0762')

build() {
  cd ${_pyname}-${pkgver}

  python -m build \
    --wheel \
    --no-isolation
}

package() {
  cd ${_pyname}-${pkgver}

  python -m installer \
    --destdir="${pkgdir}" \
    dist/*.whl

  install -Dm644 -t "${pkgdir}"/usr/share/doc/${pkgname} README.rst
  install -Dm644 -t "${pkgdir}"/usr/share/licenses/${pkgname} LICENSE
}

# vim: ts=2 sw=2 et:
