# Maintainer: Anthony25 <Anthony Ruhier>
#

pkgbase=python-selectors2
_pkgbase="${pkgbase#python-}"
pkgname=(python-selectors2 python2-selectors2)
pkgver=2.0.1
pkgrel=1
pkgdesc='Backported, durable, and portable selectors.'
arch=(any)
url='https://github.com/SethMichaelLarson/selectors2'
license=(MIT)
makedepends=(
  python-setuptools
  python2-setuptools
)
options=(!emptydirs)
source=("https://github.com/SethMichaelLarson/selectors2/archive/${pkgver}.tar.gz")
sha256sums=('482ee6168dad08fc46db82d99bc28be4b4256512809d39191d232c412d6293b4')

package_python-selectors2() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-selectors2() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
