# Maintainer: Ray Shirohara <RShirohara@gmail.com>

_name=google-cloud-vision

pkgname=python-google-cloud-vision
pkgver=2.4.3
pkgrel=1
pkgdesc='Google Cloud Vision API client library'
arch=('any')
url='https://pypi.org/project/google-cloud-vision/'
license=('Apache')
depends=(
  'python>=3.6'
  'python-google-api-core>=1.26.0'
  'python-proto-plus>=1.15.0'
  'python-packaging>=14.3'
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
sha256sums=('4a7b1c025baedae220abef612dc01b822665e5db83d680d9a31be4e0a8490e3a')

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
