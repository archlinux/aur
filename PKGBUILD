# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Guenther Starnberger <gst@sysfrog.org>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=gpshell
pkgver=2.3.1
pkgrel=2
_commit=380b79869277706757bcca7df2f4d2f005d141cc
pkgdesc="gpshell GlobalPlatform command shell"
license=('GPL3')
arch=('i686' 'x86_64')
url="https://github.com/kaoh/globalplatform"
depends=('glibc' 'globalplatform')
makedepends=('pandoc' 'cmake')
source=(https://github.com/kaoh/globalplatform/archive/$_commit.zip)
md5sums=('9d6db6ab81ae23f22b15d189aff56c21')

build() {
  cd globalplatform-$_commit/gpshell
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd globalplatform-$_commit/gpshell
  make DESTDIR=$pkgdir install
}
