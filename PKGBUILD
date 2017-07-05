# Maintainer: Stewart Webb <stew@rtwebb.com>
pkgname=mediaconch
pkgver=17.05
pkgrel=1
pkgdesc="Multimedia file conform engine - cli version"
arch=('i686' 'x86_64')
url="http://mediaarea.net"
license=('GPL')
depends=('libmediainfo')
makedepends=('libtool' 'automake' 'autoconf')
source=(https://mediaarea.net/download/source/mediaconch/$pkgver/mediaconch_$pkgver.tar.bz2)
sha256sums=('4e36c4953ebae09b2b434a29f2496962c06e51295ce71f058964c60e6928ff39')

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

