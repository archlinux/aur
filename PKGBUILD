# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Guenther Starnberger <gst@sysfrog.org>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=globalplatform
pkgver=7.4.0
_commit=9d89e9fda45286fe66c7ae88a30a950bd5320da8
pkgrel=2
pkgdesc="GlobalPlatform libraries"
license=('GPL3')
arch=('i686' 'x86_64')
url="https://github.com/kaoh/globalplatform"
depends=('glibc' 'pcsclite' 'openssl')
makedepends=('cmake')
source=(https://github.com/kaoh/globalplatform/archive/$_commit.zip)
md5sums=('65e27ac6d315ef1369dfd3d62792a0d0')

build() {
  cd globalplatform-$_commit/globalplatform
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd globalplatform-$_commit/globalplatform
  make DESTDIR=$pkgdir install
}
