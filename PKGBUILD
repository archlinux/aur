# Maintainer: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgbase=python-django-rest-swagger
_pkgbase="${pkgbase#python-}"
pkgname=python-django-rest-swagger
pkgver=2.2.0
pkgrel=1
pkgdesc='Swagger/OpenAPI Documentation Generator for Django REST Framework.'
arch=(any)
url='https://github.com/marcgibbons/django-rest-swagger'
license=(BSD)
makedepends=(
  'python-django'
  python-setuptools
)
conflicts=(
  'python-django-rest-swagger0.3.10'
)
depends=('python-django')
options=(!emptydirs)
source=("https://github.com/marcgibbons/${_pkgbase}/archive/${pkgver}.tar.gz")
sha256sums=('74ce2e90c0fb23f65bb0ce57a3304f3a16b9d9093b41e12fd316a495fdc72c47')

package_python-django-rest-swagger() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
