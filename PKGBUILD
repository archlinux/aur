# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Guenther Starnberger <gst@sysfrog.org>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=gpshell
pkgver=2.3.1
pkgrel=1
_commit=d317cc12d29fe8d38275b8c78d53a2b6a77dd07b
pkgdesc="gpshell GlobalPlatform command shell"
license=('GPL3')
arch=('i686' 'x86_64')
url="https://github.com/kaoh/globalplatform"
depends=('glibc' 'globalplatform')
makedepends=('pandoc' 'cmake')
source=(https://github.com/kaoh/globalplatform/archive/$_commit.zip)
md5sums=('f08c4f76b5d670246570dd9e18c6709a')

build() {
  cd globalplatform-$_commit/gpshell
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd globalplatform-$_commit/gpshell
  make DESTDIR=$pkgdir install
}
