# Maintainer: Andrew Sun <adsun701 at gmail dot com>

_pkgname=lifelines
pkgname=python-lifelines
pkgver=0.27.3
pkgrel=1
pkgdesc="Survival analysis in Python"
url="https://github.com/CamDavidsonPilon/lifelines"
arch=('any')
license=('MIT')
depends=('ipython' 'python-autograd-gamma' 'python-matplotlib' 'python-pandas' 'python-scikit-learn' 'python-formulaic')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/CamDavidsonPilon/lifelines/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('35f7c1431823293ba7421c6379c792da2071e2a4a8dc85c26ef7fc3695b294ed')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
} 

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
