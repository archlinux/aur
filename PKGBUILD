# Maintainer: Eric Davis <edavis@insanum.com>
# Maintainer: Samuel Walladge <samuel@swalladge.id.au>

pkgname=sncli-git
_pkgname=sncli
pkgver=0.172.0.1.3
pkgrel=1
pkgdesc="Simplenote Command Line Interface"
arch=('any')
url="https://github.com/insanum/${_pkgname}"
license=('MIT')
depends=('python-urwid' 'python-requests')
makedepends=('git')
source=("git://github.com/insanum/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
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
