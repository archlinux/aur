# Maintainer: Ray Shirohara <RShirohara@gmail.com>

_name=google-cloud-vision

pkgname=python-google-cloud-vision
pkgver=3.1.0
pkgrel=1
pkgdesc='Google Cloud Vision API client library'
arch=('any')
url='https://pypi.org/project/google-cloud-vision/'
license=('Apache')
depends=(
  'python>=3.7'
  'python-google-api-core>=1.32.0'
  'python-grpcio>=1.29.0'
  'python-proto-plus>=1.15.0'
  'python-protobuf>=3.19.0'
)
makedepends=(
  'python-setuptools'
)
optdepends=(
  'python-libcst>=0.2.5'
)
options=('!emptydirs')
source=(
  "https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha256sums=('cb59ea8da557ed29b63c68d1c61c67a93885240b9db20837c76aac79bc8c5bef')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
