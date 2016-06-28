# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
_pkgname=pylint-celery
pkgname=python-pylint-celery
pkgver=0.3
pkgrel=1
pkgdesc="pylint plugin for analyzing celery"
arch=('any')
url="https://github.com/landscapeio/pylint-celery"
license=('GPL2')
depends=('python')
makedepends=('python-setuptools')
# Temp source override because there's not tag for 0.3
source=(https://github.com/landscapeio/pylint-celery/archive/d688f97c7da6ea729d7a632db28bb37fc4aadf94.tar.gz)
md5sums=('26051966e31fb9e8f4c127f935e424df')

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
