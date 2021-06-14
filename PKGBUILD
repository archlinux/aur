# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=google-resumable-media

pkgname=python-google-resumable-media
pkgver=1.3.0
pkgrel=1
pkgdesc="Utilities for Google Media Downloads and Resumable Uploads"
arch=('any')
url="https://pypi.org/project/google-resumable-media/"
license=('APACHE')
depends=(
  'python>=3.6'
  'python-google-crc32c>=1.0'
  'python-six'
)
makedepends=('python-setuptools')
optdepends=(
  'python-requests>=2.18.0: for requests support'
  'python-aiohttp>=3.6.2: for aiohttp support'
)
options=(!emptydirs)
source=(
  "https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha256sums=(
  '030a650e6dd18faad1b86c8f64be8b6cd59a90dbc22937d25631576f0c23a305'
)

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
