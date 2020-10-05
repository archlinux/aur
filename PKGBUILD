# Maintainer: Jeremy Audet <jerebear@protonmail.com>
#
# namcap incorrectly states that python{,2} are unnecessary deps.

pkgname=python-factory_boy
_pkgname="${pkgname#python-}"
pkgver=3.1.0
pkgrel=2
pkgdesc="A fixtures replacement based on thoughtbot’s factory_bot."
arch=(any)
url='https://github.com/FactoryBoy/factory_boy'
license=(MIT)
depends=('python-faker>=0.7.0' 'python>=3.5')
makedepends=(python-distribute)
options=(!emptydirs)
source=("https://github.com/FactoryBoy/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('718a633d607b5f903c4915074116975cf37102e7cbaa97cf60c6a9a24bcdddda')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
