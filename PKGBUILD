# Maintainer: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgbase=python-coreapi
_pkgbase="${pkgbase#python-}"
pkgname=python-coreapi
pkgver=2.3.3
pkgrel=1
pkgdesc='Python client library for Core API. http://core-api.github.io/python-client/'
arch=(any)
url='https://github.com/core-api/python-client'
license=(BSD)
makedepends=(
  python-setuptools
)
options=(!emptydirs)
source=("https://github.com/core-api/python-client/archive/${pkgver}.tar.gz")
sha256sums=('e4a29e73793efb4dc34006f00ff966b3fe05ca9fe36868145c8dad7cfe0a816c')

package() {
  depends=(
    'python-coreschema'
    'python-itypes'
    'python-requests'
    'python-uritemplate'
  )
  cd "${srcdir}/python-client-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
