# Maintainer: Andrew Sun <adsun701 at gmail dot com>

_pkgname=autograd-gamma
pkgname=python-autograd-gamma
pkgver=0.4.3
pkgrel=1
pkgdesc='Autograd compatible approximations to the gamma family of functions'
url="https://github.com/CamDavidsonPilon/autograd-gamma"
arch=('any')
license=('MIT')
depends=('python-autograd')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/CamDavidsonPilon/autograd-gamma/archive/v${pkgver}.tar.gz")
sha512sums=('6d4ac784e15b7314677a23d781a866a614667f18b6083e4c4d7786d828fff694a7cf3ad04fbdbace375ad747965b1f4c9404c542c30aab16d6aa647e222f581f')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
