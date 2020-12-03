# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=blackchocobo-git
conflicts=('blackchocobo')
pkgver=1.10.0.r50.g80802af
pkgrel=1
pkgdesc="Final Fantasy 7 Save Editor"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="http://www.blackchocobo.com/"
license=('GPL3')
depends=('qt5-base' 'libff7tk')
makedepends=('cmake' 'git')
#optdepends=('otf-ipafont: font for displaying japanese')
install=$pkgname.install
source=('git://github.com/sithlord48/blackchocobo.git')
md5sums=(SKIP)

pkgver() {
  cd "blackchocobo"
  git describe | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-
}


build() {
  cd "blackchocobo"
  cmake -DCMAKE_INSTALL_PREFIX=/usr CMakeLists.txt
  make
}

package(){
  cd "blackchocobo"
  make DESTDIR=$pkgdir install
}
