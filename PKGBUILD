# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=blackchocobo
conflicts=('blackchocobo-git')
pkgver=1.12.1
pkgrel=1
pkgdesc="Final Fantasy 7 Save Editor"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="http://www.blackchocobo.com/"
license=('GPL3')
depends=('qt5-base' 'libff7tk')
#optdepends=('otf-ipafont: font for displaying japanese')
install=$pkgname.install
source=("https://github.com/sithlord48/blackchocobo/archive/v1.12.1.tar.gz")
sha256sums=('6911986fbbb73cd12cb31c66f5a41a664f66655bdadff073a0ad239857f08b80')


build() {
  cmake -S"blackchocobo-$pkgver" -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DQT_DEFAULT_MAJOR_VERSION=6
  cmake --build build
}

package(){
  DESTDIR="$pkgdir" cmake --install build
}
