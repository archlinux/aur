# Maintainer: Jeremy Audet <jerebear@protonmail.com>
#
# namcap incorrectly states that python{,2}-{django,six} are unnecessary deps.

pkgbase=python-django-tables2
_pkgbase="${pkgbase#python-}"
pkgname=(python-django-tables2 python2-django-tables2)
pkgver=1.20.0
pkgrel=1
pkgdesc='A module for rendering Django data sets as HTML tables.'
arch=(any)
url='https://github.com/bradleyayers/django-tables2'
license=(MIT)
options=(!emptydirs)
makedepends=(python-setuptools python2-setuptools)
source=("https://github.com/bradleyayers/${_pkgbase}/archive/v${pkgver}.tar.gz")
sha256sums=('ef2ba5ff3fbd376a5bccff7c16822a171e9b054bc2a6efe9d215eb2aa3b51ae5')

package_python-django-tables2() {
  depends=('python-django>=1.11')
  optdepends=('python-tablib: to export table data as CSV, XLS, etc.')
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-django-tables2() {
  depends=('python2-django>=1.11')
  optdepends=('python2-tablib: to export table data as CSV, XLS, etc.')
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
