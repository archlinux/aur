# Maintainer: Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>

_name=django-measurement
pkgname=python-django-measurement
pkgver=3.2.3
pkgrel=1
pkgdesc='A Model- & Form field for units.'
arch=(any)
url='https://github.com/coddingtonbear/django-measurement'
license=('MIT')
makedepends=(python-setuptools git)
depends=(python-django-appconf python-measurement)
source=(git+https://github.com/coddingtonbear/${_name}.git#tag=$pkgver)

sha256sums=('SKIP')

build() {
  cd "${_name}"
  python setup.py build
}

package() {
  cd "${_name}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
