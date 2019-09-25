# Maintainer: Andrew Sun <adsun701 at gmail dot com>

_pkgname=autograd-gamma
pkgname=python-autograd-gamma
pkgver=0.4.1
pkgrel=1
pkgdesc='Autograd compatible approximations to the gamma family of functions'
url="https://github.com/CamDavidsonPilon/autograd-gamma"
arch=('any')
license=('MIT')
depends=('python-autograd')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/CamDavidsonPilon/autograd-gamma/archive/v${pkgver}.tar.gz")
sha512sums=('5c778e9e6d7410584e393ae23366e845e645a3a37fb396e4ca5ecc2a85c25485b89431d10a7ab457ac6527cba13034374151ab0c3219b17ee8b630d20d86048e')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
