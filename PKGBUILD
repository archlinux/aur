# Maintainer: Sergio Correia <sergio@correia.cc>
# Contributor: Nicolas Vivet <nizzox@gmail.com>

pkgname=libphutil-git
_pkgname=libphutil
pkgver=conduit.5.464.g54dbec7
pkgrel=1
pkgdesc='Library system which organizes PHP classes and functions into modules'
arch=('any')
url="http://phabricator.com"
license=('Apache')
depends=('php')
makedepends=('git')
provides=('libphutil')
source=('git://github.com/facebook/libphutil.git')
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --always | sed 's|-|.|g' # Use the tag of the last commit
}

package() {
  mkdir -p "${pkgdir}"/usr/share/php/"${_pkgname}"
  # do not copy hidden directories
  cp -a "${srcdir}"/"${_pkgname}"/* "${pkgdir}"/usr/share/php/"${_pkgname}"/
}

# vim:set ts=2 sw=2 et:
