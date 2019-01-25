# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=google-api-core

pkgname=python-google-api-core
pkgver=1.7.0
pkgrel=1
pkgdesc="Google API client core library"
arch=('any')
url="https://pypi.org/project/google-api-core/"
license=('APACHE')
depends=(
  'python>=3.4'
  'python-googleapis-common-protos>=1.5.5'
  'python-protobuf>=3.4.0'
  'python-google-auth>=0.4.0'
  'python-requests>=2.18.0'
  'python-setuptools>=34.0.0'
  'python-six>=1.10.0'
  'python-pytz'
)
makedepends=('python-setuptools')
options=(!emptydirs)
source=(
  "https://files.pythonhosted.org/packages/f3/25/68d1e27defe75a56f1eeed4c807e31692def0052b2f1c81953ed70c3468e/google-api-core-${pkgver}.tar.gz"
)
sha256sums=(
  '85693e163a1a6faea69a74f8feaf35d54dfa2559fbdbbe389c93ffb3bb4c9a79'
)

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
