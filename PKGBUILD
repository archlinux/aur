# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=blackchocobo
conflicts=('blackchocobo-git')
pkgver=1.15.0
pkgrel=1
pkgdesc="Final Fantasy 7 Save Editor"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="http://www.blackchocobo.com/"
license=('GPL3')
depends=('qt6-base' 'libff7tk')
#optdepends=('otf-ipafont: font for displaying japanese')
install=$pkgname.install
source=("https://github.com/sithlord48/blackchocobo/archive/v1.15.0.tar.gz")
sha256sums=('199181243dcf5746470a16a96ef70c44c9394d77d0094ea1dc7bf4b6d29cf43b')


build() {
  cmake -S"blackchocobo-$pkgver" -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DQT_DEFAULT_MAJOR_VERSION=6
  cmake --build build
}

package(){
  DESTDIR="$pkgdir" cmake --install build
}
