# Maintainer: Ray Shirohara <RShirohara@gmail.com>

_name=google-cloud-vision

pkgname=python-google-cloud-vision
pkgver=3.2.0
pkgrel=1
pkgdesc='Google Cloud Vision API client library'
arch=('any')
url='https://pypi.org/project/google-cloud-vision/'
license=('Apache')
depends=(
  'python>=3.7'
  'python-google-api-core>=1.34.0'
  'python-proto-plus>=1.22.0'
  'python-protobuf>=3.19.5'
)
makedepends=(
  'python-setuptools'
)
options=('!emptydirs')
source=(
  "https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha256sums=('499431931e7b718fbcab8320f3cd234fc4e561c7f02f3e0a1291e2c8e6f65237')

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
