# Maintainer: Samuel Walladge <samuel@swalladge.id.au>
# Maintainer: Eric Brandwein <brandweineric at gmail dot com>
# Contributor: Eric Davis <edavis@insanum.com>

pkgname=sncli-git
_pkgname=sncli
pkgver=0.3.0.r1.g57bd32b
pkgrel=1
pkgdesc="Simplenote Command Line Interface"
arch=('any')
url="https://github.com/insanum/${_pkgname}"
license=('MIT')
depends=('python-urwid' 'python-requests' 'python-simperium')
makedepends=('git' 'python-setuptools')
source=("git://github.com/insanum/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
