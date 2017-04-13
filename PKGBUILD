# Maintainer: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgbase=python-coreschema
_pkgbase="${pkgbase#python-}"
pkgname=(python-coreschema python2-coreschema)
pkgver=0.0.4
pkgrel=1
pkgdesc='Python CoreSchema'
arch=(any)
url='https://github.com/core-api/python-coreschema'
license=(BSD)
makedepends=(
  python-setuptools
  python2-setuptools
)
options=(!emptydirs)
source=("https://github.com/core-api/python-coreschema/archive/${pkgver}.tar.gz")
sha256sums=('87ecf0528caff2dff0b21be97447ef2c4f3aebe32b1315ef97daccba6c68cf20')

package_python-coreschema() {
  depends=('python-jinja')
  cd "${srcdir}/python-${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-coreschema() {
  depends=('python2-jinja')
  cd "${srcdir}/python-${_pkgbase}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
