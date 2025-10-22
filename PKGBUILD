# Maintainer: Brody <archfan at brodix dot de>

_pyname=google_cloud_trace
pkgname=python-google-cloud-trace
pkgver=1.17.0
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
b2sums=('3d7daf198ea5c19f9dad01d613bdd7a26846dd1168ecae190ffed51a34a2f4ad9df3dcd056b60bc6c2811305dfc37045c28aa9dafe619ccd29bffc6eece9d8e7')

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
