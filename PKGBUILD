# Maintainer: Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>

# Not updating to v4 until python-django-measurement is compatible

_name=python-measurement
pkgname=python-measurement
pkgver=3.2.0 # 4.0a7
pkgrel=1
pkgdesc='High precision unit-aware measurement objects in Python.'
arch=(any)
url='https://github.com/coddingtonbear/python-measurement'
license=('MIT')
makedepends=(python-setuptools git)
depends=(python-sympy) # no more needed with v4
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
