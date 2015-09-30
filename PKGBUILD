# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

_pkgname=dukto-qt5
pkgname=${_pkgname}-git
pkgver=v6.r4.g0d08928
pkgrel=1
pkgdesc="A simple, fast and multi-platform file transfer tool for LAN users - Qt 5.x"
arch=(i686 x86_64)
url="https://github.com/arthurzam/${_pkgname}"
license=('GPL2')
depends=('qt5-base' 'qt5-quick1')
makedepends=('')
replaces=('dukto' 'dukto-svn')
conflicts=('dukto' 'dukto-svn')
source=("${_pkgname}::git+git://github.com/arthurzam/${_pkgname}.git")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
 
build() {
  cd "${srcdir}/${_pkgname}"
  qmake-qt5 dukto.pro
  make
}
 
package() {
  cd "${srcdir}/${_pkgname}"
  make INSTALL_ROOT="$pkgdir" install
}
