# Maintainer: Robert Hawdon <aur at robertianhawdon dot me dot uk>

_pkgname=dfshow
pkgname=${_pkgname}
pkgver=0.5.2
_pkgversub=-alpha
pkgrel=1
pkgdesc="An interactive directory/file browser written for Unix-like systems."
arch=('i686' 'x86_64' 'arm')
url="https://github.com/roberthawdon/dfshow"
license=('GPL3')
depends=('ncurses' 'libconfig')
makedepends=('autoconf' 'automake' 'libconfig')
source=(https://github.com/roberthawdon/dfshow/archive/v${pkgver}${_pkgversub}.tar.gz)
sha1sums=('91dc20ab811b4ccef2304dbf9719950df39732ac')
options=('!buildflags' '!makeflags')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}${_pkgversub}"
  ./bootstrap
  ./configure --prefix=/usr --sysconfdir=/etc --datadir=/usr/share
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}${_pkgversub}"
  make DESTDIR="${pkgdir}" install
}
