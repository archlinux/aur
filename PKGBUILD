# Maintainer: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgbase=python-django-filter
_pkgbase="${pkgbase#python-}"
pkgname=(python-django-filter python2-django-filter)
pkgver=1.0.1
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
sha256sums=('04c4a2d4eb17af35960dbaebe43f25a64c501a2cbf924d2866f5d68367ee717a')

package_python-django-filter() {
  depends=('python-django>=1.8')
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-django-filter() {
  depends=('python2-django>=1.8')
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
