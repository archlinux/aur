# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
#
# namcap incorrectly states that python{,2}-{django,six} are unnecessary deps.

pkgbase=python-django-tables2
_pkgbase="${pkgbase#python-}"
pkgname=(python-django-tables2 python2-django-tables2)
pkgver=1.1.4
pkgrel=1
pkgdesc='A module for rendering Django data sets as HTML tables.'
arch=(any)
url='https://github.com/bradleyayers/django-tables2'
license=(MIT)
makedepends=(
  python-django
  python-setuptools
  python-six
  python2-django
  python2-setuptools
  python2-six
)
options=(!emptydirs)
source=("https://github.com/bradleyayers/${_pkgbase}/archive/v${pkgver}.tar.gz")
sha256sums=('7b8911844422c430b99f80ee871b414df5769ecd58c2b9cce7b7506b04f4568f')

package_python-django-tables2() {
  depends=(python-django python-six)
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-django-tables2() {
  depends=(python2-django python2-six)
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
