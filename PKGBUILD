# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
#
# namcap incorrectly states that python{,2} are unnecessary deps.

pkgbase=python-factory_boy
_pkgbase="${pkgbase#python-}"
pkgname=(python-factory_boy python2-factory_boy)
pkgver=2.6.0
pkgrel=1
pkgdesc="A fixtures replacement based on thoughtbot's factory_girl for Ruby."
arch=(any)
url='https://github.com/rbarrois/factory_boy'
license=(MIT)
makedepends=(
  python-distribute
  python-fake-factory
  python2-distribute
  python2-fake-factory
)
options=(!emptydirs)
source=("https://github.com/rbarrois/${_pkgbase}/archive/v${pkgver}.tar.gz")
sha256sums=('b694373934311e81bc78825fb9f5360f7e0ccc67a9369b11a3b76045e995f848')

package_python-factory_boy() {
  depends=(python-fake-factory)
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-factory_boy() {
  depends=(python2-fake-factory)
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
