# Maintainer: Brody <archfan at brodix dot de>

_pyname=google_cloud_monitoring
pkgname=python-google-cloud-monitoring
pkgver=2.27.2
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
b2sums=('a362ce9bdec1e97c6d68541628b11e50115e160cc50dfe9eb4879882c4c9cb667968d72155ecec30f41ffce603b0d11b4bbbb19d9aa0e9f6e58db5f75573b7dc')

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
