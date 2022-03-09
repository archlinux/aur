# Maintainer: Ray Shirohara <RShirohara@gmail.com>

_name=google-cloud-vision

pkgname=python-google-cloud-vision
pkgver=2.7.1
pkgrel=1
pkgdesc='Google Cloud Vision API client library'
arch=('any')
url='https://pypi.org/project/google-cloud-vision/'
license=('Apache')
depends=(
  'python>=3.6'
  'python-google-api-core>=1.31.5'
  'python-proto-plus>=1.15.0'
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
sha256sums=('4f2f340bbdcadff4de6ec7521e29e6a76cbc4ca80e7eda93e4f20369fab51a03')

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
