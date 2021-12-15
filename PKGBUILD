# Maintainer: Ray Shirohara <RShirohara@gmail.com>

_name=google-cloud-vision

pkgname=python-google-cloud-vision
pkgver=2.6.3
pkgrel=1
pkgdesc='Google Cloud Vision API client library'
arch=('any')
url='https://pypi.org/project/google-cloud-vision/'
license=('Apache')
depends=(
  'python>=3.6'
  'python-google-api-core>=1.28.0'
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
sha256sums=('54b7f63c746ab95a504bd6b9b1d806192483976a3452a1a59a7faa0eaaa03491')

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
