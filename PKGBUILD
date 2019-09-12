# Maintainer: Vianney le Clément de Saint-Marcq <code AT quartic·eu>
_pkgname=undocker
pkgname=${_pkgname}-git
pkgver=20180209.gc951f02
pkgrel=2
pkgdesc="Unpacks a Docker image"
arch=('any')
url="https://github.com/larsks/undocker/"
license=('GPL3')
depends=('python')
provides=('undocker')
conflicts=('undocker')
makedepends=('python-setuptools' 'git')
source=("git://github.com/larsks/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _date=$(git show -s --format='%ci' | cut -d' ' -f1 | sed 's/-//g')
  _hash=$(git show -s --format='%h')
  echo "${_date}.g${_hash}"
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
