# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=makoureactor
conflicts=('makoureactor-git')
pkgver=2.0.0
pkgrel=1
pkgdesc="Final Fantasy 7 Field Editor"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/myst6re/makoureactor"
license=('GPL3')
depends=('qt6-base' 'zlib' 'libff7tk') #Qt6)
#optdepends=('otf-ipafont: font for displaying japanese')
source=("https://github.com/myst6re/makoureactor/archive/2.0.0.tar.gz")
sha256sums=('167d58cb904d3285321ba05447e9b1bacf80b87085562aafa1406d9d523721d9')

build() {
  cmake -S"makoureactor-$pkgver" -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DBUNDLE_FF7TK_QM=OFF
  cmake --build build
}

package(){
  DESTDIR="$pkgdir" cmake --install build
}
