# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=osgworks
pkgver=3.0.0
pkgrel=1
pkgdesc="A set of applications and software tools that add capability for OpenSceneGraph software developers"
arch=('i686' 'x86_64')
url="http://code.google.com/p/osgworks/"
license=('LGPL')
depends=('openscenegraph')
makedepends=( 'cmake' )
source=( "$pkgname-$pkgver.zip::https://docs.google.com/uc?id=0B2kjcsFgFhsONkpvZklsM0F4ODQ&export=download" )
sha1sums=('ba1ba34246578380e8005e67584d90d269f2899a')

build() {
  cd "$srcdir/osgWorks_3_00_00"
  cmake . -DCMAKE_BUILD_TYPE=Release  -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/osgWorks_3_00_00"
  make DESTDIR="$pkgdir/" install
  cd $pkgdir/usr
  mv lib64 lib
}
