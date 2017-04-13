# Maintainer: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgbase=python-itypes
_pkgbase="${pkgbase#python-}"
pkgname=(python-itypes python2-itypes)
pkgver=1.1.0
pkgrel=1
pkgdesc='Basic immutable container types for Python.'
arch=(any)
url='https://github.com/tomchristie/itypes'
license=(BSD)
makedepends=(
  python-setuptools
  python2-setuptools
)
options=(!emptydirs)
source=("https://github.com/tomchristie/${_pkgbase}/archive/${pkgver}.tar.gz")
sha256sums=('7b5ff2cb79ad42712d0c087b538fb11858f0e7e6f9d5a39475655ce5192a73c8')

package_python-itypes() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-itypes() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
