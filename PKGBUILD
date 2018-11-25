# Maintainer: Robert Hawdon <aur at robertianhawdon dot me dot uk>

_pkgname=dfshow
pkgname=${_pkgname}
pkgver=0.4.5
_pkgversub=-alpha
pkgrel=1
pkgdesc="An interactive directory/file browser written for Unix-like systems."
arch=('i686' 'x86_64' 'arm')
url="https://github.com/roberthawdon/dfshow"
license=('GPL3')
depends=('ncurses')
makedepends=('autoconf' 'automake')
source=(https://github.com/roberthawdon/dfshow/archive/v${pkgver}${_pkgversub}.tar.gz)
sha1sums=('d524f0a01e4ca5167d6f2fb63744c4eea973407b')
options=('!buildflags' '!makeflags')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}${_pkgversub}"
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}${_pkgversub}"
  make DESTDIR="${pkgdir}" install
}
