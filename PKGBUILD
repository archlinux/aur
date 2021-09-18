# Maintainer: Stas Fomin <stanislav.fomin@gmail.com>

pkgname=screenpen-git
pkgver=1.1
pkgrel=1
pkgdesc='On-screen drawing application for presentations'
url='https://github.com/belonesox/screenpen'
arch=('i686' 'x86_64')
license=('GPL3')
source=(
   'git+https://github.com/belonesox/screenpen.git'
  )
sha256sums=(
  'SKIP'
)
makedepends=('git' 'cmake')
depends=(
  'qt5-base' 
  )


prepare() {
  cd "$srcdir"/screenpen
  mkdir -p build
}

package() {
  cd "$srcdir"/screenpen/build
  cmake .. -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS=-w
  make 
  make install
}
