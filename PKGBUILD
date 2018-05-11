# Maintainer: Stewart Webb <stew@rtwebb.com>
pkgname=mediaconch
pkgver=18.03.2
pkgrel=1
pkgdesc="Implementation checker and policy checker for video and audio files (CLI)"
arch=('i686' 'x86_64')
url="http://mediaarea.net"
license=('GPL')
depends=('libmediainfo')
makedepends=('libtool' 'automake' 'autoconf')
source=(https://mediaarea.net/download/source/mediaconch/$pkgver/mediaconch_$pkgver.tar.bz2)
sha256sums=('ba64630ff582f55c104834cefc15066027ffb51f743130fb0ac7f669536b1c5c')

build() {
  cd "$srcdir"/MediaConch/Project/GNU/CLI
  sh ./autogen.sh
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir"/MediaConch/Project/GNU/CLI
  make DESTDIR="$pkgdir" install
}

