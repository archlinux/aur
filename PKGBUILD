# Contributor: Sam Stuewe <halosghost at archlinux dot info>
# Contributor: skottish <skottish97215 at gmail com>
_name='mt-st'
pkgname="${_name}-git"
pkgver=6.ece9c03
pkgrel=1
pkgdesc='Utilities for managing magnetic tape storage devices'
arch=('i686' 'x86_64')
url="https://github.com/Distrotech/${_name}"
license=('GPLv2')
makedepends=('git')
depends=('tar')
source=("${_name}::${url//https/git}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_name}"
  echo "$(git rev-list --count HEAD).$(git describe --always )"
}

build() {
  cd "${_name}"
  make
}

package() {
  cd "${_name}"
  make DESTDIR="${pkgdir}" PREFIX=/usr SBINDIR=/usr/bin install
}

# vim:set ts=2 sw=2 et:
