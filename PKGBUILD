# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Guenther Starnberger <gst@sysfrog.org>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=globalplatform
pkgver=7.3.0
_commit=f78f210824219636edc17bd9d4125289276ee12a
pkgrel=2
pkgdesc="GlobalPlatform libraries"
license=('GPL3')
arch=('i686' 'x86_64')
url="https://github.com/kaoh/globalplatform"
depends=('glibc' 'pcsclite' 'openssl')
makedepends=('cmake')
source=(https://github.com/kaoh/globalplatform/archive/$_commit.zip)
md5sums=('0c008d0e8a589da08d3e2b155bf2f5f8')

build() {
  cd globalplatform-$_commit/globalplatform
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd globalplatform-$_commit/globalplatform
  make DESTDIR=$pkgdir install
}
