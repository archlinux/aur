# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=blackchocobo
conflicts=('blackchocobo-git')
pkgver=1.15.0
pkgrel=2
pkgdesc="Final Fantasy 7 Save Editor"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="http://www.blackchocobo.com/"
license=('GPL3')
depends=('qt6-base' 'libff7tk>=1.0.0')
install=$pkgname.install
source=("blackchocobo::git+https://github.com/sithlord48/blackchocobo.git#tag=v${pkgver}")
sha256sums=('a7e6bba45dd609be6fdb11253d9ec75398efb8b4a4c622ccd6f79a8502cd8876')

build() {
  cmake -S blackchocobo -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DQT_DEFAULT_MAJOR_VERSION=6
  cmake --build build
}

package(){
  DESTDIR="$pkgdir" cmake --install build
}
