# Maintainer: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgbase=python-django-rest-swagger0.3.10
_pkgbase=django-rest-swagger
pkgname=(python-django-rest-swagger0.3.10 python2-django-rest-swagger0.3.10)
pkgver=0.3.10
pkgrel=4
pkgdesc='Swagger/OpenAPI Documentation Generator for Django REST Framework.'
arch=(any)
url='https://github.com/marcgibbons/django-rest-swagger'
license=(BSD)
makedepends=(
  'python-django'
  python-setuptools
  'python2-django'
  python2-setuptools
)
conflicts=(python-django-rest-swagger python2-django-rest-swagger)
replaces=(python-django-rest-swagger python2-django-rest-swagger)
options=(!emptydirs)
source=("https://github.com/marcgibbons/${_pkgbase}/archive/${pkgver}.tar.gz")
sha256sums=('d9e5897898b5bb33630fc8abf8f4674c50df38a007f9d242bfe65b5f12943095')

package_python-django-rest-swagger0.3.10() {
  depends=('python-django')
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-django-rest-swagger0.3.10() {
  depends=('python2-django')
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
