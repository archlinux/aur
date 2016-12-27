# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
#
# namcap incorrectly states that python{,2} are unnecessary deps.

pkgbase=python-factory_boy
_pkgbase="${pkgbase#python-}"
pkgname=(python-factory_boy python2-factory_boy)
pkgver=2.8.1
pkgrel=1
pkgdesc="A fixtures replacement based on thoughtbot's factory_girl for Ruby."
arch=(any)
url='https://github.com/rbarrois/factory_boy'
license=(MIT)
makedepends=(
  python-distribute
  'python-faker>=0.7.0'
  python2-distribute
  'python2-faker>=0.7.0'
)
options=(!emptydirs)
source=("https://github.com/rbarrois/${_pkgbase}/archive/v${pkgver}.tar.gz")
sha256sums=('6582b9342bf260c375144575f56f0378141cd368a67d2d11972b9208258c8f4d')

package_python-factory_boy() {
  depends=(python-faker)
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-factory_boy() {
  depends=(python2-faker)
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
