# Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Marek Kubica <marek@xivilization.net>
# Contributor: Javier ‘Phrodo_00’ Aravena <Phrodo.00@gmail.com>
_pkgname=cgdb
pkgname=${_pkgname}-git
pkgver=0.7.1
pkgrel=3
pkgdesc="Curses-based interface to the GNU Debugger"
arch=('x86_64')
url="http://cgdb.github.io/"
license=('GPL')
depends=('readline>=5.1' 'ncurses' 'gdb')
conflicts=('cgdb')
makedepends=('help2man')
source=("git+https://github.com/cgdb/cgdb")
sha512sums=('SKIP')

build() {
  cd ${_pkgname}
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}/" install
}
