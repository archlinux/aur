# Maintainer: Andrew Sun <adsun701 at gmail dot com>

_pkgname=lifelines
pkgname=python-lifelines
pkgver=0.27.6
_pkgver=230948c84b3f75c8de3b4b4d935276784256a34b
pkgrel=1
pkgdesc="Survival analysis in Python"
url="https://github.com/CamDavidsonPilon/lifelines"
arch=('any')
license=('MIT')
depends=('ipython' 'python-autograd-gamma' 'python-matplotlib' 'python-pandas' 'python-scikit-learn' 'python-formulaic')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/CamDavidsonPilon/lifelines/archive/230948c84b3f75c8de3b4b4d935276784256a34b.tar.gz")
sha256sums=('ac0bd52c26b674e2af4c2c609900af1cdee5c891fe39a5a589db95abb2415cad')

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  python setup.py build
} 

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
