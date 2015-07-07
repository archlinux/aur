# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=bugle
pkgver=0.0.20140104
pkgrel=1
pkgdesc="An OpenGL debugging tool"
arch=('i686' 'x86_64')
url="http://www.opengl.org/sdk/tools/BuGLe"
license=('GPL')
depends=('gtkglext' 'ffmpeg' 'libtool' 'glew')
optdepends=('readline')
makedepends=('gcc>=4.1' 'scons')
options=(!libtool)
changelog=bugle.changelog
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('21a26f507c4c97c2843debf7e4fcac51')

build() {
  cd $srcdir/$pkgname-$pkgver
  scons prefix=$pkgdir/usr pkglibdir=/usr
}

package() {
  cd $srcdir/$pkgname-$pkgver
  scons prefix=$pkgdir/usr install
  sed -i "s|$pkgdir||" $pkgdir/usr/lib/pkgconfig/bugle.pc
}
