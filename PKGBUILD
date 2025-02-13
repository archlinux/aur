# Maintainer: Brody <archfan at brodix dot de>

_pyname=google_cloud_monitoring
pkgname=python-google-cloud-monitoring
pkgver=2.27.0
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
b2sums=('491e8b1c69d2ddbb3a24097060d042dccc9ad2cb273e55ededb401ee5bfdaebdd4769ead1dbf49f50b879d427e3c77c5d74c0c030d10b6224a9d0e21d8ca6d10')

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
