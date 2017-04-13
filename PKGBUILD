# Maintainer: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgbase=python-coreapi
_pkgbase="${pkgbase#python-}"
pkgname=(python-coreapi python2-coreapi)
pkgver=2.3.0
pkgrel=1
pkgdesc='Python client library for Core API. http://core-api.github.io/python-client/'
arch=(any)
url='https://github.com/core-api/python-client'
license=(BSD)
makedepends=(
  python-setuptools
  python2-setuptools
)
options=(!emptydirs)
source=("https://github.com/core-api/python-client/archive/${pkgver}.tar.gz")
sha256sums=('0d854f8f3757cb0daeee8b69edc9e437a959c5ba937e317323a5afc8777f5fbe')

package_python-coreapi() {
  depends=(
    'python-coreschema'
    'python-itypes'
    'python-requests'
    'python-uritemplate'
  )
  cd "${srcdir}/python-client-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-coreapi() {
  depends=(
    'python2-coreschema'
    'python2-itypes'
    'python2-requests'
    'python2-uritemplate'
  )
  cd "${srcdir}/python-client-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
