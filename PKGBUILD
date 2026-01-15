# Maintainer: Brody <archfan at brodix dot de>

_pyname=google_cloud_monitoring
pkgname=python-google-cloud-monitoring
pkgver=2.29.0
pkgrel=1
pkgdesc='Google Cloud Monitoring API client library'
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
b2sums=('1ddc79ca74a635a67156027124bd68d845e118a0da7c16226265ba32c853ae0b6db2d619e687fb628d46056a4c8cb85819e5c6ed51ec18f00f7a80bc24f50b9a')

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
