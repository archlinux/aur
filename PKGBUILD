# Maintainer: Applebloom <rat.o.drat@gmail.com>

_pkgname="log4cpp"
pkgname="log4cpp-rc"
pkgver="1.1.2rc1"
pkgrel=1
pkgdesc="A library of C++ classes for flexible logging to files, syslog, IDSA and other destinations. Release candidate version."
arch=('i686' 'x86_64')
url="http://log4cpp.sourceforge.net"
license=('LGPL')
provides=($_pkgname)
conflicts=($_pkgname $_pkgname-git)
source=("http://downloads.sourceforge.net/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('1f4c51703fb6cc71379e0a94900577c3')

build() {
  cd "$_pkgname"
  ./configure --prefix=/usr --disable-static --disable-doxygen \
              --disable-dot --without-idsa
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}
