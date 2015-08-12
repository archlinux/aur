# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Chris Fordham <chris [at] fordham-nagy [dot] id [dot] au> aka flaccid
# Package Source: https://github.com/flaccid/archlinux-packages/blob/master/python-rsa-3.1.2/PKGBUILD

set -u
_pkgname='python-rsa'
_libname='rsa'
pkgver=3.1.2
pkgname="${_pkgname}-${pkgver}"
pkgrel=1
pkgdesc='Pure-Python RSA implementation.'
arch=('any')
url='http://stuvel.eu/rsa'
license=('BSD')
depends=('python')
source=("http://pypi.python.org/packages/source/r/${_libname}/${_libname}-${pkgver}.tar.gz")
#source=("https://bitbucket.org/sybren/${pkgname}/get/version-${pkgver}.tar.bz2")
sha256sums=('66eb8752a1de9b92d7679ea0e1556cf2e4a155161d0024e97e06999041e35f58')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")

build() {
  set -u
  cd "${srcdir}/${_libname}-${pkgver}"

  python setup.py build
  set +u
}

package() {
  set -u
  cd "${srcdir}/${_libname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  set +u
}
set +u
# vim:set ts=2 sw=2 et:
