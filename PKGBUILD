# Maintainer: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgbase=python-django-mptt
_pkgbase="${pkgbase#python-}"
pkgname=(python-django-mptt python2-django-mptt)
pkgver=0.9.0
pkgrel=1
pkgdesc="Utilities for implementing a modified pre-order traversal tree in django."
arch=(any)
url='https://github.com/django-mptt/django-mptt'
license=(BSD)
makedepends=(
  'python-django>=1.8'
  python-setuptools
  'python2-django>=1.8'
  python2-setuptools
)
options=(!emptydirs)
source=("https://github.com/django-mptt/${_pkgbase}/archive/${pkgver}.tar.gz")
sha256sums=('7235f1f3d6b53979eca4d27b7c5bd49e15475dba5326a653598799853b3d4f2a')

package_python-django-mptt() {
  depends=('python-django>=1.8')
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-django-mptt() {
  depends=('python2-django>=1.8')
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
