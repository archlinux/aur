# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=blackchocobo
conflicts=('blackchocobo-git')
pkgver=1.16.0
pkgrel=2
pkgdesc="Final Fantasy 7 Save Editor"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="http://www.blackchocobo.com/"
license=('GPL3')
depends=('qt6-base' 'libff7tk>=1.2.0')
install=$pkgname.install
source=("blackchocobo::git+https://github.com/sithlord48/blackchocobo.git#tag=v${pkgver}")
sha256sums=('04c4cd9544563485b247ff449e00defebd970b76fbb47602d00bafc27e11b2d2')

build() {
  cmake -S blackchocobo -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DQT_DEFAULT_MAJOR_VERSION=6
  cmake --build build
}

package(){
  DESTDIR="$pkgdir" cmake --install build
}
