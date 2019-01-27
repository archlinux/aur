# Maintainer: Jeremy Audet <jerebear@protonmail.com>

pkgbase=python-django-tables2
pkgname=(python-django-tables2 python2-django-tables2)
pkgver=2.0.4
pkgrel=1
pkgdesc='A module for rendering Django data sets as HTML tables.'
arch=(any)
url='https://github.com/bradleyayers/django-tables2'
license=(MIT)
options=(!emptydirs)
makedepends=(python-setuptools python2-setuptools)
source=("https://github.com/bradleyayers/django-tables2/archive/v${pkgver}.tar.gz")
sha256sums=('c815737bed57af8ca0815167da421161fbac95d85874973747e12b1155f9c8eb')

package_python-django-tables2() {
  depends=('python-django>=1.11')
  optdepends=('python-tablib: to export table data as CSV, XLS, etc.')
  cd "${srcdir}/django-tables2-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-django-tables2() {
  depends=('python2-django>=1.11')
  optdepends=('python2-tablib: to export table data as CSV, XLS, etc.')
  cd "${srcdir}/django-tables2-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
