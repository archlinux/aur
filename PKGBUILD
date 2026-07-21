#Maintainer: Frederic Bezies <fredbezies at gmail dot com>
#Contributor: Daniel Milde

pkgname=dustrac
_pkgname=DustRacing2D
pkgver=2.2.0
pkgrel=1
pkgdesc="Dust Racing 2D is a traditional top-down car racing game including a level editor"
arch=('i686' 'x86_64')
url="http://juzzlin.github.io/DustRacing2D/"
license=('GPL3')
depends=('openal' 'libvorbis' 'qt6-tools' 'glu')
makedepends=('cmake')
source=("https://github.com/juzzlin/DustRacing2D/archive/${pkgver}.tar.gz")
sha256sums=('9a393675106d90b7c4fcf8e3280a1b80c0c35e90f03ce75742276b40d5495182')

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

