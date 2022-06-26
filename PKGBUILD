# Maintainer: Andrew Sun <adsun701 at gmail dot com>

_pkgname=lifelines
pkgname=python-lifelines
pkgver=0.27.1
pkgrel=1
pkgdesc="Survival analysis in Python"
url="https://github.com/CamDavidsonPilon/lifelines"
arch=('any')
license=('MIT')
depends=('python-autograd-gamma' 'python-matplotlib' 'python-pandas' 'python-formulaic')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/CamDavidsonPilon/lifelines/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('799614c584aaf1acc08948dd64356f9ffd66dd1dc18d0296b5c4bde06b67cd3c')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
} 

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
