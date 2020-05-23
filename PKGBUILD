# Maintainer: Jeremy Audet <jerebear@protonmail.com>
#
# namcap incorrectly states that python{,2} are unnecessary deps.

pkgname=python-factory_boy
_pkgname="${pkgname#python-}"
pkgver=2.12.0
pkgrel=2
pkgdesc="A fixtures replacement based on thoughtbot's factory_girl for Ruby."
arch=(any)
url='https://github.com/FactoryBoy/factory_boy'
license=(MIT)
depends=('python-faker>=0.7.0')
makedepends=(python-distribute)
options=(!emptydirs)
source=("https://github.com/FactoryBoy/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('717c7f865f0228196f8170b09004c05e9576f78211986397abbabff565106c3f')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
