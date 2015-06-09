# Maintainer: Raphael Scholer <rascholer@gmail.com>
_pkgname='python-moc'
pkgname="${_pkgname}-git"
pkgver=1.0_2_g36df2e5
pkgrel=1
pkgdesc="Python bindings for Music On Console"
arch=('any')
url="http://github.com/rscholer/${_pkgname}"
license=('MIT')
depends=('python' 'moc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
makedepends=('python-setuptools')
source=("git+file:///home/raphael/Documents/Code/Local/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  echo "$(git describe --always |sed 's#-#_#g;s#v##')"
}

package() {
  cd "${_pkgname}"
  python setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=1
}
# vim:set ts=2 sw=2 et:
