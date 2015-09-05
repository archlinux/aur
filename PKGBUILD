# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Abazigal <abazigal77@hotmail.com>

set -u
_pkgname='simward'
pkgname="${_pkgname}-git"
pkgver=0.5.r2.gf2a9254
pkgrel=1
pkgdesc='Command line program for easy TCP / UDP port forwarding'
arch=('i686' 'x86_64')
url='https://github.com/Abazigal/simward'
license=('GPL')
makedepends=('git')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_srcdir="${_pkgname^^}"
source=("${_srcdir}::git://github.com/Abazigal/simward.git")
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_srcdir}"
  git describe --long | sed -e 's:^v::g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  make
  set +u
}
package() {
  set -u
  cd "${_srcdir}"
  make install PREFIX="${pkgdir}/usr"
  set +u
}
set +u
