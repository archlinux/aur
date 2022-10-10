# Maintainer: Stewart Webb <stew@rtwebb.com>
pkgname=mediaconch
pkgver=22.09
pkgrel=1
pkgdesc="Implementation checker and policy checker for video and audio files (CLI)"
arch=('i686' 'x86_64')
url="http://mediaarea.net"
license=('GPL')
depends=('libmediainfo' 'sqlite' 'jansson' 'libxslt')
makedepends=('libtool' 'automake' 'autoconf')
source=(https://mediaarea.net/download/source/mediaconch/$pkgver/mediaconch_$pkgver.tar.bz2)
sha256sums=('ce20b135d870a8e35f916ee7a7e229302a5ac7a9ffa6455c5e5c70d8e3515676')

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
