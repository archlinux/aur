# Maintainer: Brody <archfan at brodix dot de>

_pyname=google_cloud_trace
pkgname=python-google-cloud-trace
pkgver=1.18.0
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
b2sums=('8a32fba2ed1a5edb4cf53992f4812f5d3c2a3b796e6370139f41cd4133ead91c87481d95cf9d42000d6c39c561a29db32f464a54572b856a831ff83c89b10313')

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
