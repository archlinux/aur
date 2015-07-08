# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
#
# namcap warns that python2-django and python2-six are unnecessary dependencies.
# This is untrue.

pkgname=python2-django-tables2
_pkgname="${pkgname#python2-}"
pkgver=1.0.4
pkgrel=1
pkgdesc='A module for rendering Django data sets as HTML tables.'
arch=(any)
url='https://github.com/bradleyayers/django-tables2'
license=(MIT)
depends=(python2-django python2-six)
makedepends=(python2-setuptools)
options=(!emptydirs)
source=("https://github.com/bradleyayers/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f8312d38c245ddc777605c3e2508d3517435179ae9952e5cb7d870966e09317f')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
