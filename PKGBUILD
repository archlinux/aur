pkgname=ev3
pkgver=1.0
pkgrel=1
pkgdesc="C++ library to compute symbolic derivatives"
arch=('i686' 'x86_64')
license=(CPL)
url="https://github.com/xantares/ev3"
depends=('gcc-libs')
makedepends=('cmake')
source=("git+https://github.com/xantares/ev3.git")
md5sums=('SKIP')

build()
{
  cd "$srcdir/ev3"
  mkdir -p build && pushd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

package ()
{
  cd "$srcdir/ev3/build"
  make DESTDIR="$pkgdir" install
}

