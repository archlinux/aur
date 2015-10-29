# Maintainer: Justin R. St-Amant <jstamant24 at gmail dot com>

pkgname=cammill
pkgver=0.9_test_17
pkgrel=1
pkgdesc="CAM application to produce tool paths and gcode from DXF files"
arch=('i686' 'x86_64')
url="https://github.com/cammill/cammill"
license=('GPL3')
depends=('freeglut'
         'glib2'
         'gtkglext'
         'gtksourceview2'
         'gtk2' 
         'lua51')
makedepends=('clang' 'git')
checkdepends=('cppcheck')
provides=('cammill')
conflicts=('cammill-git')
source=("$pkgname-${pkgver//_/-}::https://github.com/cammill/cammill/archive/v0.9-test-17.tar.gz")
md5sums=('070f7d4b603a387c27dfeb715c698367')

build()
{
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  make clean all
}

check()
{
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  make check
}

package()
{
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  make INSTALL_PATH="$pkgdir/usr" install
}
