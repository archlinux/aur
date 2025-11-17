# Maintainer: Stewart Webb <stew@rtwebb.com>
pkgname=mediaconch
pkgver=25.04
pkgrel=1
pkgdesc="Implementation checker and policy checker for video and audio files (CLI)"
arch=('i686' 'x86_64')
url="http://mediaarea.net"
license=('GPL')
depends=('libmediainfo' 'sqlite' 'jansson' 'libxslt')
makedepends=('libtool' 'automake' 'autoconf')
source=(https://mediaarea.net/download/binary/mediaconch/"$pkgver"/MediaConch_CLI_"$pkgver"_GNU_FromSource.tar.bz2)
sha256sums=('800d076ca374a0c954c928f471761fb000b36b7df9d8e1d1bb03b233edff8857')

build() {
  cd "$srcdir"/MediaConch_CLI_GNU_FromSource/MediaConch/Project/GNU/CLI/
  sh ./autogen.sh
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir"/MediaConch_CLI_GNU_FromSource/MediaConch/Project/GNU/CLI/
  make DESTDIR="$pkgdir" install
}
