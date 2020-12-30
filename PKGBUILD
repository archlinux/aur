# Maintainer: Jeremy Audet <jerebear@protonmail.com>
#
# namcap incorrectly states that python{,2} are unnecessary deps.

pkgname=python-factory_boy
_pkgname="${pkgname#python-}"
pkgver=3.2.0
pkgrel=1
pkgdesc="A fixtures replacement based on thoughtbot’s factory_bot."
arch=(any)
url='https://github.com/FactoryBoy/factory_boy'
license=(MIT)
depends=('python-faker>=0.7.0' 'python>=3.6')
makedepends=(python-distribute)
options=(!emptydirs)
source=("https://github.com/FactoryBoy/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f59f8c2dcad310f24a7428532d900c495db0e13e409d2d8aace3d237c2a6d93d')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
