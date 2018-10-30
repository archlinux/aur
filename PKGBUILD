# Maintainer: getzze
# Contributor: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgbase=python-django-filter1.1
_pkgbase="django-filter"
pkgname=(python-django-filter1.1 python2-django-filter1.1)
pkgver=1.1.0
pkgrel=1
pkgdesc='Django-filter is a reusable Django application for allowing users to filter querysets dynamically.'
arch=(any)
url='https://github.com/carltongibson/django-filter'
license=(BSD)
makedepends=(
  'python-django>=1.8'
  python-setuptools
  'python2-django>=1.8'
  python2-setuptools
)
options=(!emptydirs)
source=("https://github.com/carltongibson/${_pkgbase}/archive/${pkgver}.tar.gz")
sha256sums=('2894cb3dbea0a7e0117f9f5fe8e64d356113784b51346e2cd23b49b3fb97e71e')

package_python-django-filter1.1() {
  depends=('python-django>=1.8')
  provides=(python-django-filter)
  conflicts=(python-django-filter)
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-django-filter1.1() {
  depends=('python2-django>=1.8')
  provides=(python2-django-filter)
  conflicts=(python2-django-filter)
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
