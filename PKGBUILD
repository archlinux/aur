# Maintainer: Vincent Grande <shoober420@gmail.com>

pkgname=rottexpr-git
pkgver=1
pkgrel=1
pkgdesc='Source port for the original Rise of the Triad'
arch=('i686' 'x86_64')
url="https://github.com/LTCHIPS/rottexpr"
license=('GPL3')
conflicts=("rottexpr")
provides=("rottexpr")
depends=('sdl2' 'sdl2_mixer')
makedepends=(git)
source=("git+https://github.com/LTCHIPS/rottexpr")
md5sums=('SKIP')

pkgver() {
  cd rottexpr
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd rottexpr
  
  autoreconf -fi
  make
}

package() {
  cd rottexpr
  make DESTDIR="$pkgdir/" install
}
