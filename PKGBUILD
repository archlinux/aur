# Maintainer: Jeremy Audet <jerebear@protonmail.com>
#
# namcap incorrectly states that python{,2} are unnecessary deps.

pkgname=python-factory_boy
_pkgname="${pkgname#python-}"
pkgver=3.0.1
pkgrel=2
pkgdesc="A fixtures replacement based on thoughtbot’s factory_bot."
arch=(any)
url='https://github.com/FactoryBoy/factory_boy'
license=(MIT)
depends=('python-faker>=0.7.0' 'python>=3.5')
makedepends=(python-distribute)
options=(!emptydirs)
source=("https://github.com/FactoryBoy/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('0eb0b39c2c05eb27164a7df9ebb69f132a36d7e49284ce437bc18e01d55e3e27')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
