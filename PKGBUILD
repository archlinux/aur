#Maintainer: Frederic Bezies <fredbezies at gmail dot com>
#Contributor: Daniel Milde

pkgname=dustrac
_pkgname=DustRacing2D
pkgver=2.1.1
pkgrel=2
pkgdesc="Dust Racing 2D is a traditional top-down car racing game including a level editor"
arch=('i686' 'x86_64')
url="http://juzzlin.github.io/DustRacing2D/"
license=('GPL3')
depends=('openal' 'libvorbis' 'qt5-tools' 'glu')
makedepends=('cmake')
source=("https://github.com/juzzlin/DustRacing2D/archive/${pkgver}.tar.gz")
sha256sums=('e028a49ad427fb0527b2bf05dad72404cc2d20883da1d330cb1319246bdc423a')

build() {
  cd $srcdir/$_pkgname-$pkgver
  mkdir build && cd build
  cmake .. -DReleaseBuild=ON -DCMAKE_INSTALL_PREFIX=/usr
  make
}


package() {
  cd $srcdir/$_pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}

# vim: sw=2:ts=2 et:

