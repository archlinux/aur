# Maintainer: Yauhen Kirylau <actionless.loveless+aur@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
_pkgname=vulture
pkgname=python-vulture
pkgver=1.2
pkgrel=1
pkgdesc="Finds dead code in Python projects"
arch=('any')
url="https://github.com/jendrikseipp/vulture/"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=(https://github.com/jendrikseipp/$_pkgname/archive/v$pkgver.tar.gz)
md5sums=('ebd77c48a18b2e45b3e1a253f2d72b99')

build() {
  cd "${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "${_pkgname}-$pkgver"
  python setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=1
  install -Dm755 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
}
# vim:set ts=2 sw=2 et:
