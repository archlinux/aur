# Maintainer: Andrew Sun <adsun701 at gmail dot com>

_pkgname=autograd-gamma
pkgname=python-autograd-gamma
pkgver=0.5.0
pkgrel=1
pkgdesc='Autograd compatible approximations to the gamma family of functions'
url="https://github.com/CamDavidsonPilon/autograd-gamma"
arch=('any')
license=('MIT')
depends=('python-autograd')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('b787fc6844717f85cb6babdb50b594f77d2509d0955b1b49a2fd6f0070f07d9ba48ae83c35b50185caac129942bc5091f8bbcd77ab23f6f22f32850b6601c488')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
