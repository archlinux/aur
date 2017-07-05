# Maintainer: Stewart Webb <stew@rtwebb.com>
pkgname=mediaconch
pkgver=17.06
pkgrel=1
pkgdesc="Implementation checker and policy checker for video and audio files (CLI)"
arch=('i686' 'x86_64')
url="http://mediaarea.net"
license=('GPL')
depends=('libmediainfo')
makedepends=('libtool' 'automake' 'autoconf')
source=(https://mediaarea.net/download/source/mediaconch/$pkgver/mediaconch_$pkgver.tar.bz2)
sha256sums=('911ddf541e8ce540ef3e2346c3381ed207927b60ff9d15982fdb00af1b54ea69')

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

