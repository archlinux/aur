# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
#
# namcap incorrectly states that python{,2}-{django,six} are unnecessary deps.

pkgbase=python-django-tables2
_pkgbase="${pkgbase#python-}"
pkgname=(python-django-tables2 python2-django-tables2)
pkgver=1.9.0
pkgrel=1
pkgdesc='A module for rendering Django data sets as HTML tables.'
arch=(any)
url='https://github.com/bradleyayers/django-tables2'
license=(MIT)
makedepends=(
  'python-django>=1.8'
  python-setuptools
  'python2-django>=1.8'
  python2-setuptools
)
options=(!emptydirs)
source=("https://github.com/bradleyayers/${_pkgbase}/archive/v${pkgver}.tar.gz")
sha256sums=('8d7a29f126bd5e5c0dca7ee492c6feca6bd9158c9d9521cfe3c6bdef3fed9390')

package_python-django-tables2() {
  depends=('python-django>=1.8')
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-django-tables2() {
  depends=('python2-django>=1.8')
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
