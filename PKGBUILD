# Maintainer: Yauhen Kirylau <actionless.loveless+aur@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
_pkgname=vulture
pkgname=python-vulture
pkgver=2.3
pkgrel=2
pkgdesc="Finds dead code in Python projects"
arch=('any')
url="https://github.com/jendrikseipp/vulture/"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=(https://github.com/jendrikseipp/$_pkgname/archive/v$pkgver.tar.gz)
md5sums=('d55549b92ae52c99e492f393da94bc32')

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
