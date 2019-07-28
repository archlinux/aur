# Maintainer: Jeremy Audet <jerebear@protonmail.com>

pkgbase=python-django-tables2
pkgname=(python-django-tables2 python2-django-tables2)
pkgver=2.1.0
pkgrel=1
pkgdesc='A module for rendering Django data sets as HTML tables.'
arch=(any)
url='https://github.com/bradleyayers/django-tables2'
license=(MIT)
options=(!emptydirs)
makedepends=(python-setuptools python2-setuptools)
source=("https://github.com/bradleyayers/django-tables2/archive/v${pkgver}.tar.gz")
sha256sums=('77e53a50d535359d6a119c1fab7a44c2d1c21397d2c80a7d11215112a4866005')

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
