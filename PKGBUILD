# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=google-resumable-media

pkgname=python-google-resumable-media
pkgver=0.3.2
pkgrel=1
pkgdesc="Utilities for Google Media Downloads and Resumable Uploads"
arch=('any')
url="https://pypi.org/project/google-resumable-media/"
license=('APACHE')
depends=(
  'python-six'
)
makedepends=('python-setuptools')
options=(!emptydirs)
source=(
  "https://files.pythonhosted.org/packages/7e/80/21b397208d19346e29c4f4cd96249f55013fe8932a94ea22681b4ba23d35/google-resumable-media-${pkgver}.tar.gz"
)
sha256sums=(
  '3e38923493ca0d7de0ad91c31acfefc393c78586db89364e91cb4f11990e51ba'
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
