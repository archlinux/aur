# Maintainer: Sergio Correia <sergio@correia.cc>

pkgname='rubiksolver-git'
_pkgname='rubiksolver'
pkgver=1.1.r0.g83426da
pkgrel=1
pkgdesc="A Qt/QML application to assist with solving the popular Rubik's cube"
arch=('i686' 'x86_64')
url="https://github.com/qrwteyrutiyoup/rubiksolver"
license=('GPL')
depends=('qt5-quick1')
makedepends=('git')
source=('git://github.com/qrwteyrutiyoup/rubiksolver.git')
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags --long | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "${_pkgname}"
  make INSTALL_ROOT="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/share
}

# vim:set ts=2 sw=2 et:
