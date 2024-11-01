# Maintainer: Andrew Sun <adsun701 at gmail dot com>

_pkgname=lifelines
pkgname=python-lifelines
pkgver=0.30.0
pkgrel=1
pkgdesc="Survival analysis in Python"
url="https://github.com/CamDavidsonPilon/lifelines"
arch=('any')
license=('MIT')
depends=('ipython' 'python-autograd-gamma' 'python-matplotlib' 'python-pandas' 'python-scikit-learn' 'python-formulaic')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/CamDavidsonPilon/lifelines/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3d474c138d941f48c3b7a7b116b35823ab90e303e09b6f1e9a01e982a5f9e671')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
} 

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
