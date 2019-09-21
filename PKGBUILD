# Maintainer: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgbase=python-django-filter
_pkgbase="${pkgbase#python-}"
pkgname=python-django-filter
pkgver=2.2.0
pkgrel=1
pkgdesc='Django-filter is a reusable Django application for allowing users to filter querysets dynamically.'
arch=(any)
url='https://github.com/carltongibson/django-filter'
license=(BSD)
makedepends=(
  'python-django>=1.11'
  python-setuptools
)
options=(!emptydirs)
source=("https://github.com/carltongibson/${_pkgbase}/archive/${pkgver}.tar.gz")
sha256sums=('b79b3e40b3c4ddabec8b1ba7e083351129950d9ec8ea155a96e3ff965033c2d3')

package_python-django-filter() {
  depends=('python-django>=1.11')
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
