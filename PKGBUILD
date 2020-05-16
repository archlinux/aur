# Maintainer: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgbase=python-django-mptt
_pkgbase="${pkgbase#python-}"
pkgname=python-django-mptt
pkgver=0.11.0
pkgrel=1
pkgdesc="Utilities for implementing a modified pre-order traversal tree in django."
arch=(any)
url='https://github.com/django-mptt/django-mptt'
license=(BSD)
makedepends=(
  'python-django>=3.0'
  python-setuptools
)
depends=('python-django>=3.0')
options=(!emptydirs)
source=("https://github.com/django-mptt/${_pkgbase}/archive/${pkgver}.tar.gz")
sha256sums=('acbecfc6d56c53f894a2e28d15aef9d922f21c0a4976a5a2e48855f420ee976e')

package_python-django-mptt() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
