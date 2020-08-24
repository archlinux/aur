# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=blackchocobo-git
conflicts=('blackchocobo')
pkgver=v1.10.0.r36.g4dfbf4a
pkgrel=1
pkgdesc="Final Fantasy 7 Save Editor"
arch=('any')
url="http://www.blackchocobo.com/"
license=('GPL3')
depends=('qt5-base')
makedepends=('cmake')
#optdepends=('otf-ipafont: font for displaying japanese')
install=$pkgname.install
source=('git://github.com/sithlord48/blackchocobo.git')
md5sums=(SKIP)

pkgver() {
  cd "blackchocobo"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
