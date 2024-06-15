# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=blackchocobo
conflicts=('blackchocobo-git')
pkgver=1.16.0
pkgrel=1
pkgdesc="Final Fantasy 7 Save Editor"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="http://www.blackchocobo.com/"
license=('GPL3')
depends=('qt6-base' 'libff7tk>=1.1.0')
install=$pkgname.install
source=("blackchocobo::git+https://github.com/sithlord48/blackchocobo.git#tag=v${pkgver}")
sha256sums=('9da9c75228c11cb66615f38643dfbe8e9bfdceb3e02b37775b4e35264d79afba')

build() {
  cmake -S blackchocobo -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DQT_DEFAULT_MAJOR_VERSION=6
  cmake --build build
}

package(){
  DESTDIR="$pkgdir" cmake --install build
}
