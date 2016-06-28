# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
_pkgname=pylint-django
pkgname=python-pylint-django
pkgver=0.7.2
pkgrel=1
pkgdesc="Pylint plugin for improving code analysis for when using Django"
arch=('any')
url="https://github.com/landscapeio/pylint-django"
license=('GPL2')
depends=('python')
makedepends=('python-setuptools')
# source=(https://github.com/landscapeio/pylint-django/archive/${pkgver}.tar.gz)
# Temp source override because there's not tag for 0.7.2
source=(https://github.com/landscapeio/pylint-django/archive/e381721eedcaf240bf56b038878c1e7fad848183.tar.gz)
md5sums=('2106197486ad595e192242221493df7f')

build() {
  cd "${_pkgname}-"*

  python setup.py build
}

package() {
  cd "${_pkgname}-"*

  python setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=1
  install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
}
# vim:set ts=2 sw=2 et:
