# Maintainer: Chris Gahan <chris@ill-logic.com>

pkgname=doodle-svn
_pkgname=doodle
pkgver=0.8.r36953
pkgrel=1
pkgdesc="Doodle is a tool to quickly search the documents on a computer. (Supports filesystem monitoring.)"
arch=('i686' 'x86_64')
url="http://grothoff.org/christian/doodle/"
license=('GPL')
depends=('libextractor' 'gamin')
makedepends=('subversion')
provides=('doodle')
conflicts=('doodle')
# source=("$pkgname::svn+https://subversion.assembla.com/svn/smplayer/smplayer/trunk/")
source=("svn+https://gnunet.org/svn/doodle/")
sha256sums=('SKIP')

pkgver() {
  cd ../${_pkgname}
  echo 0.8.r$(svnversion)
}

build() {
  cd ${_pkgname}

  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname}
  make DESTDIR="$pkgdir" install
}
