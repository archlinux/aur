# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
_pkgname=vulture
pkgname=python-vulture
pkgver=0.8.1
pkgrel=1
pkgdesc="Finds dead code in Python projects"
arch=('any')
url="https://bitbucket.org/jendrikseipp/vulture"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=(https://bitbucket.org/jendrikseipp/vulture/get/v${pkgver}.tar.bz2)
md5sums=('a302f97c06e07ace7995b3016456ca1d')

build() {
  cd *"-${_pkgname}-"*

  python setup.py build
}

package() {
  cd *"-${_pkgname}-"*

  python setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=1
  install -Dm755 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
}
# vim:set ts=2 sw=2 et:
