# Maintainer: alucryd <alucryd at gmail dot com>
# Contributor: Huulivoide <jesse dot jaara at gmail dot com>
# Contributor: Sven-Hendrik Haase <sh at lutzhaase dot com>

pkgname=soil
pkgver=1.16
pkgrel=1
pkgdesc="A tiny C lib primarily for loading textures into OpenGL"
arch=('i686' 'x86_64')
url="http://www.lonesock.net/soil.html"
license=('CCPL')
depends=('glibc')
makedepends=('mesa')
options=('!staticlibs')
source=('http://www.lonesock.net/files/soil.zip')
sha256sums=('a2305b8d64f6d636e36d669bbdb0ca5445d1345c754b3d61d3f037dad2e5f701')

prepare() {
  cd "Simple OpenGL Image Library"

  sed 's/-Wall/-Wall -fPIC/' -i "projects/makefile/alternate Makefile.txt"
  sed 's/1.07-20071110/1.16/' -i "projects/makefile/alternate Makefile.txt"
}

build() {
  cd "Simple OpenGL Image Library/src"

  make -f "../projects/makefile/alternate Makefile.txt"
}

package() {
  cd "Simple OpenGL Image Library/src"

  make -f "../projects/makefile/alternate Makefile.txt" DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
