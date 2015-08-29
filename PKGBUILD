# Maintainer: Yushin Huang <hyslion AT gmail.com>

_pkgname=libchewing
pkgname=libchewing-git
pkgver=1567.ba4c90b
pkgrel=1
pkgdesc='Intelligent Chinese phonetic input method'
url='http://chewing.im/'
arch=('i686' 'x86_64')
license=('GPL')
conflicts=('libchewing')
provides=('libchewing')
source=("git://github.com/chewing/libchewing/")
md5sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
